package com.paulokeller.findmyphone

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.ContactsContract
import android.renderscript.Sampler
import android.view.*
import android.widget.AdapterView
import android.widget.BaseAdapter
import android.widget.Toast
import androidx.core.app.ActivityCompat
import com.google.firebase.database.*
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.contact_ticket.view.*
import java.lang.Exception
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList
import kotlin.collections.HashMap

class MainActivity : AppCompatActivity() {
    private var adapter: ContactAdapter? = null
    private var contacts = ArrayList<UserContact>()
    private var databaseRef: DatabaseReference? = null
    private val listOfContacts = HashMap<String, String>()
    private val CONTACT_CODE = 123
    private val LOCATION_CODE = 3443
    private var isAccessLocation = false


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val userData = UserData(this)
        userData.isFirstTimeLoad()
        databaseRef = FirebaseDatabase.getInstance().reference

        adapter = ContactAdapter(this, contacts)
        lvContactList.adapter = adapter
        lvContactList.onItemClickListener = AdapterView.OnItemClickListener { parent, view, position, id ->
            val userInfo = contacts[position]
            val df = SimpleDateFormat("yyyy/MMM/dd HH:MM:ss")
            val date = Date()

            databaseRef!!.child("Users").child(userInfo.phoneNumber).child("request").setValue(df.format(date).toString())

            val intent = Intent(applicationContext, MapsActivity::class.java)
            intent.putExtra("phoneNumebr", userInfo.phoneNumber)
            startActivity(intent)
        }
    }

    override fun onResume() {
        super.onResume()

        val userData = UserData(applicationContext)
        if (userData.loadPhoneNumber() == "empty") {
            return
        }

        refreshUsers()
        if (isAccessLocation) return
        checkContactPermission()
        checkLocationPermission()
    }

    private fun refreshUsers() {
        val userData = UserData(applicationContext)
        databaseRef!!.child("Users").child(userData.loadPhoneNumber()).child("Finders").addValueEventListener(object : ValueEventListener {
            override fun onDataChange(dataSnapshot: DataSnapshot) {
                try {
                    val td = dataSnapshot.value as HashMap<String, Any>
                    contacts.clear()
                    if (td == null) {

                        contacts.add(UserContact("NO_USERS", "nothing"))
                        adapter!!.notifyDataSetChanged()
                        return
                    }

                    for (key in td.keys) {
                        val name = contacts[key.toInt()]
                        contacts.add(UserContact(name.toString(), key))
                    }

                    adapter!!.notifyDataSetChanged()
                } catch (ex: Exception) {
                    contacts.add(UserContact("NO_USERS", "nothing"))
                    adapter!!.notifyDataSetChanged()
                }


            }

            override fun onCancelled(p0: DatabaseError) {
            }
        })
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater = menuInflater
        inflater.inflate(R.menu.main_menu, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.addTracker -> {
                val intent = Intent(this, MyTrackers::class.java)
                startActivity(intent)
            }
            R.id.help -> {

            }
        }
        return super.onOptionsItemSelected(item)
    }


    private fun checkContactPermission() {
        if (Build.VERSION.SDK_INT >= 23) {
            if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED) {
                requestPermissions(arrayOf(android.Manifest.permission.READ_CONTACTS), CONTACT_CODE)
                return
            }
        }
        loadContact()
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {

        when (requestCode) {
            CONTACT_CODE -> {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    loadContact()
                } else {
                    Toast.makeText(this, "Cannot access to contact", Toast.LENGTH_LONG).show()
                }
            }
            LOCATION_CODE -> {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    getUserLocation()
                } else {
                    Toast.makeText(this, "Cannot access to location", Toast.LENGTH_LONG).show()
                }
            }
            else -> {
                super.onRequestPermissionsResult(requestCode, permissions, grantResults)
            }
        }
    }

    private fun loadContact() {
        try {
            listOfContacts.clear()

            val cursor = contentResolver.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null, null, null)
            cursor!!.moveToFirst()

            do {
                val name = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME))
                val phoneNumber = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER))

                listOfContacts[UserData.formatPhoneNumber(phoneNumber)] = name
            } while (cursor.moveToNext())
        } catch (ex:Exception) {

        }

    }

    inner class ContactAdapter(var context: Context, var list: ArrayList<UserContact>) : BaseAdapter() {
        override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
            val userContact = list[p0]
            return if (userContact.name == "NO_USERS") {
                val inflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
                val myView = inflater.inflate(R.layout.no_user, null)
                myView
            } else {
                val inflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
                val myView = inflater.inflate(R.layout.contact_ticket, null)
                myView.tvName.text = userContact.name
                myView.tvPhoneNumber.text = userContact.phoneNumber

                myView
            }
        }

        override fun getItem(p0: Int): Any {
            return list[p0]
        }

        override fun getItemId(p0: Int): Long {
            return p0.toLong()
        }

        override fun getCount(): Int {
            return list.size
        }

    }

    private fun checkLocationPermission() {
        isAccessLocation = true
        if (Build.VERSION.SDK_INT >= 23) {
            if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                requestPermissions(arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION), LOCATION_CODE)
                return
            }
        }
        getUserLocation()
    }

    fun getUserLocation() {
        // Start service
        if (!MyService.isServiceRunning) {
            val intent = Intent(baseContext, MyService::class.java)
            startService(intent)
        }
    }
}
