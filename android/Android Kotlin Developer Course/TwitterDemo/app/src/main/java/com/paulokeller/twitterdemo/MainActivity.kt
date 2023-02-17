package com.paulokeller.twitterdemo

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.Toast
import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.AdView
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
import com.google.firebase.storage.FirebaseStorage
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.add_ticket.view.*
import kotlinx.android.synthetic.main.tweets_ticket.view.*
import java.io.ByteArrayOutputStream
import java.lang.Exception
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList
import kotlin.collections.HashMap

class MainActivity : AppCompatActivity() {
  private val tweets = ArrayList<Ticket>()
  private var adapter: MyTweetAdapter? = null
  private val PICK_IMAGE_CODE = 131
  private val database = FirebaseDatabase.getInstance()
  private val myRef = database.reference
  private var myEmail: String? = null
  private var myUID: String? = null
  private var downloadURL: String? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    val bundle: Bundle? = intent.extras
    myEmail = bundle!!.getString("email")
    myUID = bundle.getString("uid")

    tweets.add(Ticket("0", "him", "url", "add"))
    tweets.add(Ticket("0", "him", "url", "ads"))
    adapter = MyTweetAdapter(this, tweets)
    lvTweets.adapter = adapter
    loadPosts()
  }

  inner class MyTweetAdapter(context: Context, var listTweetsAdapter: ArrayList<Ticket>) : BaseAdapter() {
    var context: Context? = context
    override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
      var myTweet = listTweetsAdapter[p0]

      if (myTweet.tweetPersonUID.equals("add")) {
        val myView = layoutInflater.inflate(R.layout.add_ticket, null)
        myView.iv_attach.setOnClickListener(View.OnClickListener {
          loadImage()
        })

        myView.iv_post.setOnClickListener(View.OnClickListener {
          val text = myView.etPost.text.toString()
          val postInfo = PostInfo(myUID, text, downloadURL)

          myRef.child("posts").push().setValue(postInfo)
        })

        return myView
      } else if (myTweet.tweetPersonUID.equals("loading")) {
        return layoutInflater.inflate(R.layout.loading_ticket, null)
      } else if (myTweet.tweetPersonUID.equals("ads")) {
        val myView = layoutInflater.inflate(R.layout.ads_ticket, null)
        val mAdView = myView.findViewById(R.id.adView) as AdView
        val adRequest = AdRequest.Builder().build()
        mAdView.loadAd(adRequest)
        return myView
      } else {
        val myView = layoutInflater.inflate(R.layout.tweets_ticket, null)
        myView.txt_tweet.text = myTweet.tweetText
        myView.txtUserName.text = myTweet.tweetPersonUID
        Picasso.get().load(myTweet.tweetImageUrl).into(myView.tweet_picture)

        myRef.child("Users").child(myTweet.tweetPersonUID!!).addValueEventListener(object : ValueEventListener {
          override fun onDataChange(dataSnapshot: DataSnapshot) {
            try {
              val td = dataSnapshot.value as HashMap<String, Any>
              for (key in td.keys) {
                val userInfo = td[key] as String
                if (key == "ProfileImage") {
                  Picasso.get().load(userInfo).into(myView.picture_path)
                } else {
                  myView.txtUserName.text = userInfo
                }
              }
            } catch (ex: Exception) {

            }
          }

          override fun onCancelled(p0: DatabaseError) {
            TODO("Not yet implemented")
          }
        })

        return myView
      }
    }

    override fun getItem(p0: Int): Any {
      return listTweetsAdapter[p0]
    }

    override fun getItemId(p0: Int): Long {
      return p0.toLong()
    }

    override fun getCount(): Int {

      return listTweetsAdapter.size

    }
  }

  private fun loadImage() {
    val intent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI)
    startActivityForResult(intent, PICK_IMAGE_CODE)
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
    super.onActivityResult(requestCode, resultCode, data)

    if ((requestCode == PICK_IMAGE_CODE) && (resultCode == Activity.RESULT_OK) && (data != null)) {
      val selectedImage = data.data
      val filePathColumn = arrayOf(MediaStore.Images.Media.DATA)
      val cursor = contentResolver.query(selectedImage!!, filePathColumn, null, null, null)
      cursor!!.moveToFirst()
      val columnIndex = cursor.getColumnIndex(filePathColumn[0])
      val picturePath = cursor.getString(columnIndex)
      cursor.close()
      uploadImage(BitmapFactory.decodeFile(picturePath))
    }
  }


  private fun uploadImage(bitmap: Bitmap) {
    tweets.add(0, Ticket("0", "him", "url", "loading"))
    adapter!!.notifyDataSetChanged();

    val storage = FirebaseStorage.getInstance()
    val storageRef = storage.getReferenceFromUrl("gs://twitterdemo-8d095.appspot.com")
    val df = SimpleDateFormat("ddMMyyHHmmss")
    val dateObj = Date()
    val imagePath = myEmail!!.substring(1, 4) + df.format(dateObj) + ".jpg"
    val imageRef = storageRef.child("imagesPost/$imagePath")

    val baos = ByteArrayOutputStream()
    bitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos)
    val data = baos.toByteArray()
    val uploadTask = imageRef.putBytes(data)
    uploadTask.addOnFailureListener {
      Toast.makeText(this, "Fail to upload", Toast.LENGTH_LONG).show()
    }.addOnSuccessListener { taskSnapshot ->
      downloadURL = taskSnapshot.uploadSessionUri.toString()
      tweets.removeAt(0)
      adapter!!.notifyDataSetChanged();
    }
  }

  fun loadPosts() {
    myRef.child("posts").addValueEventListener(object : ValueEventListener {
      override fun onDataChange(dataSnapshot: DataSnapshot) {
        try {
          tweets.clear()
          tweets.add(Ticket("0", "him", "url", "add"))
          tweets.add(Ticket("0", "him", "url", "ads"))
          val td = dataSnapshot.value as HashMap<String, Any>
          for (key in td.keys) {
            val post = td[key] as HashMap<String, Any>

            tweets.add(Ticket(key, post["text"] as String, post["postImage"] as String, post["userUID"] as String))
          }
          adapter!!.notifyDataSetChanged()
        } catch (ex: Exception) {

        }
      }

      override fun onCancelled(p0: DatabaseError) {
        TODO("Not yet implemented")
      }
    })
  }


}
