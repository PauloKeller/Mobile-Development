package com.paulokeller.tictactoylocal


import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
import kotlinx.android.synthetic.main.activity_main.*
import java.lang.Exception
import kotlin.random.Random

class MainActivity : AppCompatActivity() {
    private val player1 = ArrayList<Int>()
    private val player2 = ArrayList<Int>()
    private var activePlayer = 1
    private var sessionID: String? = null
    private var playerSymbol: String? = null
    private var mFirebaseAnalytics: FirebaseAnalytics? = null
    private val database = FirebaseDatabase.getInstance()
    private val myRef = database.reference
    private var myEmail: String? = null
    private var number = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        mFirebaseAnalytics = FirebaseAnalytics.getInstance(this)

        val b: Bundle = intent.extras
        myEmail = b.getString("email")
        inComingCalls()
    }

    fun buClick(view: View) {
        val buSelected: Button = view as Button
        var cellID = 0
        when (buSelected.id) {
            R.id.bu1 -> cellID = 1
            R.id.bu2 -> cellID = 2
            R.id.bu3 -> cellID = 3
            R.id.bu4 -> cellID = 4
            R.id.bu5 -> cellID = 5
            R.id.bu6 -> cellID = 6
            R.id.bu7 -> cellID = 7
            R.id.bu8 -> cellID = 8
            R.id.bu9 -> cellID = 9
        }



        Toast.makeText(this, "ID: $cellID", Toast.LENGTH_LONG).show()

        myRef.child("PlayOnline").child(sessionID!!).child(cellID.toString()).setValue(myEmail)
    }

    private fun playGame(cellID: Int, buSelected: Button) {
        if (activePlayer == 1) {
            buSelected.text = "X"
            buSelected.setBackgroundResource(R.color.blue)
            player1.add(cellID)
            activePlayer = 2
        } else {
            buSelected.text = "0"
            buSelected.setBackgroundResource(R.color.darkGreen)
            player2.add(cellID)
            activePlayer = 1
        }

        buSelected.isEnabled = false
        checkWinner()
    }

    private fun checkWinner() {
        var winner = -1

        // row 1
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
            winner = 1
        }
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
            winner = 1
        }

        // row 2
        if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
            winner = 1
        }
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
            winner = 2
        }

        // row 3
        if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
            winner = 1
        }
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
            winner = 2
        }

        // column 1
        if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
            winner = 1
        }
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
            winner = 1
        }

        // column 2
        if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
            winner = 1
        }
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
            winner = 2
        }

        // column 3
        if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
            winner = 1
        }
        if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
            winner = 2
        }

        if (winner != -1) {
            if (winner == 1) {
                Toast.makeText(this, "Player 1 win the game", Toast.LENGTH_LONG).show()
            } else {
                Toast.makeText(this, "Player 2 win the game", Toast.LENGTH_LONG).show()
            }
        }

    }

    private fun autoPlay(cellID: Int) {
        val buSelect: Button?
        when (cellID) {
            1 -> buSelect = bu1
            2 -> buSelect = bu2
            3 -> buSelect = bu3
            4 -> buSelect = bu4
            5 -> buSelect = bu5
            6 -> buSelect = bu6
            7 -> buSelect = bu7
            8 -> buSelect = bu8
            9 -> buSelect = bu9
            else -> {
                buSelect = bu1
            }
        }

        playGame(cellID, buSelect)
    }

    fun buRequestEvent(view: View) {
        val userEmail = etEmail.text.toString()
        myRef.child("Users").child(splitString(userEmail)).child("Request").push().setValue(myEmail)

        playOnline(splitString(myEmail!!) + splitString(userEmail))
        playerSymbol = "X"
    }

    fun buAcceptEvent(view: View) {
        val userEmail = etEmail.text.toString()
        myRef.child("Users").child(splitString(userEmail)).child("Request").push().setValue(myEmail)

        playOnline(splitString(userEmail) + splitString(myEmail!!))
        playerSymbol = "O"
    }

    private fun playOnline(sessionID: String) {
        this.sessionID = sessionID
        myRef.child("PlayerOnline").removeValue()
        myRef.child("PlayerOnline").child(sessionID)
            .addValueEventListener(object : ValueEventListener {
                override fun onDataChange(dataSnapshot: DataSnapshot) {
                    try {
                        player1.clear()
                        player2.clear()

                        val td = dataSnapshot.value as HashMap<String, String>
                        var value: String
                        for (key in td.keys) {
                            value = td[key] as String
                            etEmail.setText(value)

                            if (value != myEmail) {
                                activePlayer = if (playerSymbol === "X") 1 else 2
                            } else {
                                activePlayer = if (playerSymbol === "X") 2 else 1
                            }

                            autoPlay(key.toInt())
                        }
                    } catch (ex: Exception) {

                    }
                }

                override fun onCancelled(p0: DatabaseError) {
                    TODO("Not yet implemented")
                }
            })
    }

    private fun splitString(str: String): String {
        val split = str.split("@")
        return split[0]
    }

    private fun inComingCalls() {
        myRef.child("Users").child(splitString(myEmail!!)).child("Request")
            .addValueEventListener(object : ValueEventListener {
                override fun onDataChange(dataSnapshot: DataSnapshot) {
                    try {
                        val td = dataSnapshot.value as HashMap<*, *>
                        val value: String
                        for (key in td.keys) {
                            value = td[key] as String
                            etEmail.setText(value)

                            val notifyMe = Notifications()
                            notifyMe.notify(
                                applicationContext,
                                value + " want to play tic tac toy",
                                number
                            )
                            number++
                            myRef.child("Users").child(splitString(myEmail!!)).child("Request")
                                .setValue(true)

                            break
                        }
                    } catch (ex: Exception) {

                    }
                }

                override fun onCancelled(p0: DatabaseError) {
                    TODO("Not yet implemented")
                }
            })
    }
}

