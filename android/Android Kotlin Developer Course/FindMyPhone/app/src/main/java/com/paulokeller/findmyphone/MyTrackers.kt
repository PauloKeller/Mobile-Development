package com.paulokeller.findmyphone

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.ContactsContract
import android.view.*
import android.widget.BaseAdapter
import android.widget.Toast
import androidx.core.app.ActivityCompat
import kotlinx.android.synthetic.main.activity_my_trackers.*
import kotlinx.android.synthetic.main.contact_ticket.view.*

class MyTrackers : AppCompatActivity() {
    private val contacts = ArrayList<UserContact>()
    private val adapter = ContactAdapter(this, contacts)
    private val CONTACT_CODE = 123
    private val PICK_CODE = 131

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_my_trackers)
        lvContactList.adapter = adapter
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater = menuInflater
        inflater.inflate(R.menu.tracker_menu, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.finishActivity -> {
                finish()
            }
            R.id.addContact -> {
                checkPermission()
            }
        }
        return super.onOptionsItemSelected(item)
    }

    private fun checkPermission() {
        if (Build.VERSION.SDK_INT >= 23) {
            if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED) {
                requestPermissions(arrayOf(android.Manifest.permission.READ_CONTACTS), CONTACT_CODE)
                return
            }
        }
        pickContact()
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when (requestCode) {
            CONTACT_CODE -> {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    pickContact()
                } else {
                    Toast.makeText(this, "Cannot access to contact", Toast.LENGTH_LONG).show()
                }
            }
        }
    }

    private fun pickContact() {
        val intent = Intent(Intent.ACTION_PICK, ContactsContract.Contacts.CONTENT_URI)
        startActivityForResult(intent, PICK_CODE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            PICK_CODE -> {
                if ((requestCode == Activity.RESULT_OK) && (data != null)) {
                    val contactData = data.data
                    val mContentResolver = contentResolver.query(contactData!!, null, null, null, null)
                    if (mContentResolver!!.moveToFirst()) {
                        val id = mContentResolver.getString(mContentResolver.getColumnIndexOrThrow(ContactsContract.Contacts._ID))
                        val hasPhone = mContentResolver.getString(mContentResolver.getColumnIndexOrThrow(ContactsContract.Contacts.HAS_PHONE_NUMBER))
                        if (hasPhone != "1") {
                            val phones = contentResolver.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                                    null, ContactsContract.CommonDataKinds.Phone.CONTACT_ID + "=" + id, null, null)
                            phones!!.moveToFirst()
                            val phoneNumber = phones.getString(mContentResolver.getColumnIndex("data1"))
                            val name = phones.getString(mContentResolver.getColumnIndex(ContactsContract.Contacts.DISPLAY_NAME))
                            contacts.add(UserContact(name, phoneNumber))
                            adapter.notifyDataSetChanged()
                        }
                    }
                }
            }
        }
    }


    inner class ContactAdapter(var context: Context, var list: ArrayList<UserContact>) : BaseAdapter() {
        override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
            val userContact = list[p0]
            val inflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
            val myView = inflater.inflate(R.layout.contact_ticket, null)
            myView.tvName.text = userContact.name
            myView.tvPhoneNumber.text = userContact.phoneNumber

            return myView
        }

        override fun getItem(p0: Int): Any {
            return list[p0]
        }

        override fun getItemId(p0: Int): Long {
            TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
        }

        override fun getCount(): Int {
            return list.size
        }

    }

}
