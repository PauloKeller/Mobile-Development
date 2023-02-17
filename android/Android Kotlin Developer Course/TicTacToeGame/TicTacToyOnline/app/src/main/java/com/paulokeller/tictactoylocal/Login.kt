package com.paulokeller.tictactoylocal

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.FirebaseDatabase
import kotlinx.android.synthetic.main.activity_login.*

class Login : AppCompatActivity() {
    private var mAuth: FirebaseAuth? = null
    private var database = FirebaseDatabase.getInstance()
    private var myRef = database.reference

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
        mAuth = FirebaseAuth.getInstance()
    }

    fun buEventLogin(view: View) {
        loginToFirebase(etEmail.text.toString(), etPassword.text.toString())
    }

    private fun loginToFirebase(email: String, password: String) {
        mAuth!!.createUserWithEmailAndPassword(email, password)
            .addOnCompleteListener(this) { task ->
                if (task.isSuccessful) {
                    Toast.makeText(applicationContext, "Successful login", Toast.LENGTH_LONG).show()

                    val currentUser = mAuth!!.currentUser
                    if (currentUser != null) {
                        myRef.child("Users").child(splitString(currentUser.email.toString())).child("Request")
                            .setValue(currentUser.uid)
                        navigateToMain()
                    }
                } else {
                    Toast.makeText(applicationContext, "fail login", Toast.LENGTH_LONG).show()
                }
            }
    }

    override fun onStart() {
        super.onStart()
        navigateToMain()
    }

    private fun navigateToMain() {
        val currentUser = mAuth!!.currentUser
        if (currentUser != null) {
            val intent = Intent(this, MainActivity::class.java)
            intent.putExtra("email", currentUser.email)
            intent.putExtra("uid", currentUser.uid)
            startActivity(intent)
        }
    }

    private fun splitString(str: String): String {
        val split = str.split("@")
        return split[0]
    }
}
