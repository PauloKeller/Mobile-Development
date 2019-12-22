package com.paulokeller.getsunset

import android.os.AsyncTask
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStream
import java.io.InputStreamReader
import java.lang.Exception
import java.net.HttpURLConnection
import java.net.URL

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun getSunset(view: View) {
        var city="rochester,ny"
        val url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22$city%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
        MyAsyncTask().execute(url)
    }

    inner class MyAsyncTask: AsyncTask<String, String, String>() {
        override fun onPreExecute() {
            super.onPreExecute()
        }

        override fun doInBackground(vararg p0: String?): String {
            try {
                val url = URL(p0[0])
                val urlConnect=url.openConnection() as HttpURLConnection
                urlConnect.connectTimeout = 700
                var inString = convertStreamToString(urlConnect.inputStream)
                publishProgress(inString)
            } catch (ex:Exception) {}
            return " "
        }

        override fun onProgressUpdate(vararg values: String?) {
            try {
                val json = JSONObject(values[0]!!)
                val query = json.getJSONObject("query")
                val results=query.getJSONObject("results")
                val channels=results.getJSONObject("channel")
                val astronomy=channels.getJSONObject("astronomy")
                val sunrise = astronomy.getString("sunrise")
                tvSunSetTime.text = "Sunrise time is $sunrise"
            }catch (ex:Exception) {}
        }

        override fun onPostExecute(result: String?) {
            super.onPostExecute(result)
        }
    }

    fun convertStreamToString(inputStream:InputStream): String {
        val bufferReader = BufferedReader(InputStreamReader(inputStream))
        var line:String
        var allString:String = ""

        try {
            do {
                line=bufferReader.readLine()
                if(line !=null) {
                    allString+=line
                }
            } while(line!=null)
            inputStream.close()
        } catch (ex:Exception) {}

        return allString
    }

}
