package com.paulokeller.noteapp

import android.content.ContentValues
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_add_notes.*
import kotlinx.android.synthetic.main.ticket.*
import java.lang.Exception

class AddNotes : AppCompatActivity() {
    var id = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_notes)

        val bundle: Bundle? = intent.extras
        if (bundle != null) {
            id = bundle.getInt("ID", 0)
            if (id != 0) {
                etTitle.setText(bundle.getString("Title").toString())
                etDes.setText(bundle.getString("Description").toString())
            }
        }


    }

    fun buAdd(view: View) {
        val dbManage = DBManager(this)
        val values = ContentValues()
        values.put("Title", etTitle.text.toString())
        values.put("Description", etDes.text.toString())

        if (id == 0) {
            val id = dbManage.insert(values)
            if (id > 0) {
                Toast.makeText(this, "note is added", Toast.LENGTH_LONG).show()
                finish()
            } else {
                Toast.makeText(this, "cannot add note", Toast.LENGTH_LONG).show()
            }
        } else {
            val selectionArgs = arrayOf(id.toString())
            val id = dbManage.update(values, "ID=?", selectionArgs)
            if (id > 0) {
                Toast.makeText(this, "note is updated", Toast.LENGTH_LONG).show()
                finish()
            } else {
                Toast.makeText(this, "cannot updated note", Toast.LENGTH_LONG).show()
            }
        }
    }
}
