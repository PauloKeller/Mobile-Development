package com.paulokeller.noteapp

import android.content.ContentValues
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_add_notes.*
import kotlinx.android.synthetic.main.ticket.*

class AddNotes : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_notes)
    }

    fun buAdd(view: View) {
        val dbManage = DBManager(this)
        val values = ContentValues()
        values.put("Title", etTitle.text.toString())
        values.put("Description", etDes.text.toString())

        val id = dbManage.insert(values)
        if (id > 0) {
            Toast.makeText(this, "note is added", Toast.LENGTH_LONG).show()
            finish()
        } else {
            Toast.makeText(this, "cannot add note", Toast.LENGTH_LONG).show()
        }
    }
}
