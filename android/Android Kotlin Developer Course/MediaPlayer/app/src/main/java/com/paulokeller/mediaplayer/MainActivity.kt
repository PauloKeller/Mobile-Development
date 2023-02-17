package com.paulokeller.mediaplayer

import android.content.pm.PackageManager
import android.media.MediaPlayer
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.MediaController
import android.widget.Toast
import androidx.core.app.ActivityCompat
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.song_ticket.view.*
import java.lang.Exception

class MainActivity : AppCompatActivity() {
    private val songs = ArrayList<SongInfo>()
    private val adapter = MySongAdapter(songs)
    private val mediaPlayer = MediaPlayer()
    private val REQUEST_CODE_ASK_PERMISSIONS = 123
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadUrlOnline()
        lvListSongs.adapter = adapter

        val mySongTrack = MySongTrack()
        mySongTrack.start()
        checkUserPermsions()
    }

    private fun loadUrlOnline() {
        songs.add(SongInfo("001", "Thubti", "http://server6.mp3quran.net/thubti/001.mp3"))
        songs.add(SongInfo("002", "Thubti", "http://server6.mp3quran.net/thubti/002.mp3"))
        songs.add(SongInfo("003", "Thubti", "http://server6.mp3quran.net/thubti/003.mp3"))
        songs.add(SongInfo("004", "Thubti", "http://server6.mp3quran.net/thubti/004.mp3"))
        songs.add(SongInfo("005", "Thubti", "http://server6.mp3quran.net/thubti/005.mp3"))
    }

    inner class MySongAdapter(private val list: ArrayList<SongInfo>) : BaseAdapter() {
        private val songs = list

        override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
            val myView = layoutInflater.inflate(R.layout.song_ticket, null)
            val song = this.songs[p0]
            myView.tvSongName.text = song.title
            myView.tvAuthor.text = song.author

            myView.buPlay.setOnClickListener(View.OnClickListener {
                try {
                    if (myView.buPlay.text == "Stop") {
                        mediaPlayer.stop()
                        myView.buPlay.text = "Play"
                    } else {
                        mediaPlayer.setDataSource(song.url)
                        mediaPlayer.prepare()
                        mediaPlayer.start()
                        myView.buPlay.text = "Stop"
                        sbProgress.max = mediaPlayer.duration
                    }
                } catch (ex: Exception) {

                }
            })
            return myView
        }

        override fun getItem(p0: Int): Any {
            return this.songs[p0]
        }

        override fun getItemId(p0: Int): Long {
            return p0.toLong()
        }

        override fun getCount(): Int {
            return this.songs.size
        }

    }

    inner class MySongTrack : Thread() {
        override fun run() {
            super.run()
            while (true) {
                try {
                    Thread.sleep(1000)
                } catch (ex: Exception) {

                }

                runOnUiThread {
                    sbProgress.progress = mediaPlayer.currentPosition
                }
            }
        }
    }

    fun checkUserPermsions() {
        if (Build.VERSION.SDK_INT >= 23) {
            if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.READ_EXTERNAL_STORAGE)
                != PackageManager.PERMISSION_GRANTED
            ) {
                requestPermissions(
                    arrayOf(android.Manifest.permission.READ_EXTERNAL_STORAGE),
                    REQUEST_CODE_ASK_PERMISSIONS
                )
                return
            }
        }

        loadSong()
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        when (requestCode) {
            REQUEST_CODE_ASK_PERMISSIONS -> if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                loadSong()
            } else {
                Toast.makeText(this, "denail", Toast.LENGTH_SHORT).show()
            }
            else -> super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        }
    }

    fun loadSong() {
        val allSongsURI = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        val selection = MediaStore.Audio.Media.IS_MUSIC + "!=0"
        val cursor = contentResolver.query(allSongsURI, null, selection, null, null)
        if (cursor != null) {
            if (cursor.moveToFirst()) {
                do {
                    val songURL = cursor.getString(cursor.getColumnIndex(MediaStore.Audio.Media.DATA))
                    val songAuthor = cursor.getString(cursor.getColumnIndex(MediaStore.Audio.Media.ARTIST))
                    val songName = cursor.getString(cursor.getColumnIndex(MediaStore.Audio.Media.DISPLAY_NAME))
                    songs.add(SongInfo(songName, songAuthor, songURL))
                } while (cursor.moveToNext())
            }
        }
        cursor!!.close()
        lvListSongs.adapter = adapter
    }
}
