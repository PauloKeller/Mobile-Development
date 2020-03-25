package com.paulokeller.twitterdemo

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
  private val tweets = ArrayList<Ticket>()
  private var adapter:MyTweetAdapter? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    // dummy data
    tweets.add(Ticket("awdad", "awdawda", "dawdawd", "dawdaw"))
    tweets.add(Ticket("awawrarfaw", "awqweqweqwe", "gegreerterett", "terrtertert"))
    adapter = MyTweetAdapter(this, tweets)
    lvTweets.adapter = adapter

  }

  inner class MyTweetAdapter(context: Context, var listTweetsAdapter: ArrayList<Ticket>) : BaseAdapter() {
    var context: Context? = context

    override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
      var mytweet = listTweetsAdapter[p0]

      if (mytweet.tweetPersonUID.equals("add")) {
          val myView = layoutInflater.inflate(R.layout.add_ticket, null)
          return myView
        } else {


        val myView = layoutInflater.inflate(R.layout.tweets_ticket, null)
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

}
