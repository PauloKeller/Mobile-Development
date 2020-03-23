package com.paulokeller.noteapp

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import android.widget.Toast

class DBManager(context: Context) {
    val dbName = "MyNotes"
    private val dbTable = "Notes"
    val dbVersion = 1
    private val colID = "ID"
    private val colTitle = "title"
    private val colDes = "Description"
    val sqlCreateTable =
        "CREATE TABLE IF NOT EXISTS $dbTable ($colID INTEGER PRIMARY KEY, $colTitle TEXT, $colDes TEXT)"
    private var sqlDB: SQLiteDatabase? = null

    init {
        val db = DatabaseHelperNotes(context)
        sqlDB = db.writableDatabase
    }

    inner class DatabaseHelperNotes(private var context: Context) :
        SQLiteOpenHelper(context, dbName, null, dbVersion) {
        override fun onCreate(p0: SQLiteDatabase?) {
            p0!!.execSQL(sqlCreateTable)
            Toast.makeText(context, "database is created", Toast.LENGTH_LONG).show()
        }

        override fun onUpgrade(p0: SQLiteDatabase?, p1: Int, p2: Int) {
            p0!!.execSQL("Drop table IF EXISTS $dbTable")
        }
    }

    fun insert(values:ContentValues) : Long{
        return sqlDB!!.insert(dbTable,"", values)
    }
}