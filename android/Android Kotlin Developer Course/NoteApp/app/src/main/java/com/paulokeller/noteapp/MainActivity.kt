package com.paulokeller.noteapp

import android.app.SearchManager
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.SearchView
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.ticket.view.*

class MainActivity : AppCompatActivity() {
    val listNotes = ArrayList<Note>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadQuery("%")
    }

    override fun onResume() {
        super.onResume()
        loadQuery("%")
    }

    private fun loadQuery(title: String) {
        val dbManager = DBManager(this)
        val projections = arrayOf("ID", "title", "Description")
        val selectionArgs = arrayOf(title)
        val cursor = dbManager.query(projections, "title like ?", selectionArgs, "title")
        listNotes.clear()
        if (cursor.moveToFirst()) {
            do {

                val cID = cursor.getInt(cursor.getColumnIndex("ID"))
                val cTitle = cursor.getString(cursor.getColumnIndex("title"))
                val cDes = cursor.getString(cursor.getColumnIndex("Description"))
                val note = Note(cID, cTitle, cDes)

                listNotes.add(note)
            } while (cursor.moveToNext())

            val myNotesAdapter = MyNotesAdapter(this, listNotes)
            lvNotes.adapter = myNotesAdapter
        }
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.main_menu, menu)

        val sv = menu!!.findItem(R.id.app_bar_search).actionView as SearchView
        val sm = getSystemService(Context.SEARCH_SERVICE) as SearchManager
        sv.setSearchableInfo(sm.getSearchableInfo(componentName))
        sv.setOnQueryTextListener(object : SearchView.OnQueryTextListener {
            override fun onQueryTextSubmit(query: String?): Boolean {
                Toast.makeText(applicationContext, query, Toast.LENGTH_LONG).show()
                loadQuery("%$query%")
                return false
            }

            override fun onQueryTextChange(query: String?): Boolean {
                return false
            }
        })

        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.addNote -> {
                // Go to add page
                val intent = Intent(this, AddNotes::class.java)
                startActivity(intent)
            }
        }

        return super.onOptionsItemSelected(item)
    }

    inner class MyNotesAdapter(context: Context, private var listNotesAdapter: ArrayList<Note>) :
        BaseAdapter() {

        val contxt = context

        override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
            val myView = layoutInflater.inflate(R.layout.ticket, null)
            val myNote = listNotesAdapter[p0]
            myView.tvTitle.text = myNote.noteName
            myView.tvDes.text = myNote.noteDes
            myView.ivDelete.setOnClickListener(View.OnClickListener {
                val dbManager = DBManager(contxt)
                val selectionArgs = arrayOf(myNote.noteID.toString())
                dbManager.delete("ID=?", selectionArgs)
                loadQuery("%")
            })

            myView.ivEdit.setOnClickListener(View.OnClickListener {
                goToUpdate(myNote)
            })

            return myView
        }

        override fun getItem(p0: Int): Any {
            return listNotesAdapter[p0]
        }

        override fun getItemId(p0: Int): Long {
            return p0.toLong()
        }

        override fun getCount(): Int {
            return listNotesAdapter.size
        }

    }

    fun goToUpdate(note: Note) {
        val intent = Intent(this, AddNotes::class.java)
        intent.putExtra("ID", note.noteID)
        intent.putExtra("Title", note.noteName)
        intent.putExtra("Description", note.noteDes)
        startActivity(intent)
    }
}
