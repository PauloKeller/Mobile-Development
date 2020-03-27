package com.paulokeller.twitterdemo

import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.drawable.BitmapDrawable
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import android.view.View
import android.widget.Toast
import androidx.core.app.ActivityCompat
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.FirebaseUser
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.storage.FirebaseStorage
import com.google.firebase.storage.StorageReference
import com.google.firebase.storage.UploadTask
import kotlinx.android.synthetic.main.activity_login.*
import java.io.ByteArrayOutputStream
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList

class Login : AppCompatActivity() {
  val READ_IMAGE: Int = 253
  var PICK_IMAGE_CODE: Int = 12
  private var mAuth: FirebaseAuth? = null
  private var currentUser: FirebaseUser? = null
  private val database = FirebaseDatabase.getInstance()
  private val myRef = database.reference


  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_login)
    mAuth = FirebaseAuth.getInstance()

    ivImagePerson.setOnClickListener(View.OnClickListener {
      checkPermission()
    })

    FirebaseMessaging.getInstance().subscribeToTopic("news")
  }

  fun buLoginEvent(view: View) {
    loginToFireBase(etEmail.text.toString(), etPassword.text.toString())
  }

  private fun loginToFireBase(email: String, password: String) {
    mAuth!!.createUserWithEmailAndPassword(email, password)
      .addOnCompleteListener(this) { task ->

        if (task.isSuccessful) {
          Toast.makeText(applicationContext, "Successful login", Toast.LENGTH_LONG).show()

          if (mAuth!!.currentUser != null) {
            currentUser = mAuth!!.currentUser
            saveImageFirebase()
          }

        } else {
          Toast.makeText(applicationContext, "fail login", Toast.LENGTH_LONG).show()
        }

      }

  }

  private fun saveImageFirebase() {
    val email = currentUser!!.email!!.substring(1, 4)
    val storage = FirebaseStorage.getInstance()
    val storageRef = storage.getReferenceFromUrl("gs://twitterdemo-8d095.appspot.com")
    val df = SimpleDateFormat("ddMMyyHHmmss")
    val dateObj = Date()
    val imagePath = email + df.format(dateObj) + ".jpg"
    val imageRef = storageRef.child("images/$imagePath")
    ivImagePerson.isDrawingCacheEnabled = true
    ivImagePerson.buildDrawingCache()

    val drawable = ivImagePerson.drawable as BitmapDrawable
    val bitmap = drawable.bitmap
    val baos = ByteArrayOutputStream()
    bitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos)
    val data = baos.toByteArray()
    val uploadTask = imageRef.putBytes(data)
    uploadTask.addOnFailureListener {
      Toast.makeText(this, "Fail to upload", Toast.LENGTH_LONG).show()
    }.addOnSuccessListener { taskSnapshot ->
      val downLoadURL = taskSnapshot.uploadSessionUri.toString()
      myRef.child("Users").child(currentUser!!.uid).child("Email").setValue(currentUser!!.email)
      myRef.child("Users").child(currentUser!!.uid).child("ProfileImage").setValue(downLoadURL)

      loadTweets()
    }

  }

  override fun onStart() {
    super.onStart()

    loadTweets()
  }

  fun loadTweets() {
    val currentUser = mAuth!!.currentUser
    if (currentUser != null) {
      val intent = Intent(this, MainActivity::class.java)
      intent.putExtra("email", currentUser.email)
      intent.putExtra("uid", currentUser.uid)
      startActivity(intent)
    }
  }

  private fun checkPermission() {
    if (Build.VERSION.SDK_INT >= 23) {
      if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
        requestPermissions(arrayOf(android.Manifest.permission.READ_EXTERNAL_STORAGE), READ_IMAGE)
        return
      }
    }

    loadImage()
  }

  override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
    super.onRequestPermissionsResult(requestCode, permissions, grantResults)

    when (requestCode) {
      READ_IMAGE -> {
        if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
          loadImage()
        } else {
          Toast.makeText(this, "Cannot access your images", Toast.LENGTH_LONG).show()
        }
      }
    }
  }

  private fun loadImage() {
    val intent = Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI)
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
      ivImagePerson.setImageBitmap(BitmapFactory.decodeFile(picturePath))
    }
  }


}
