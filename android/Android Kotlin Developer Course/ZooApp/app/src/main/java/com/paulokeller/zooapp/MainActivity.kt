package com.paulokeller.zooapp

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.animal_ticket.view.*

class MainActivity : AppCompatActivity() {
  private val animals = ArrayList<Animal>()
  private var adapter: AnimalsAdapter? = null

  fun loadAnimals() {
    animals.add(Animal("Baboon", "Baboon live in  big place with tree", R.drawable.baboon, false))
    animals.add(Animal("Bulldog", "Bulldog live in  big place with tree", R.drawable.bulldog, false))
    animals.add(Animal("Panda", "Panda live in  big place with tree", R.drawable.panda, true))
    animals.add(Animal("Swallow", "Swallow live in  big place with tree", R.drawable.swallow_bird, false))
    animals.add(Animal("Tiger", "Tiger live in  big place with tree", R.drawable.white_tiger, true))
    animals.add(Animal("Zebra", "Zebra live in  big place with tree", R.drawable.zebra, false))

    adapter = AnimalsAdapter(animals, this)
    tvListAnimal.adapter = adapter
  }

  fun delete(index:Int) {
    animals.removeAt(index)
    adapter!!.notifyDataSetChanged()
  }

  fun add (index: Int) {
    animals.add(index, animals[index])
    adapter!!.notifyDataSetChanged()
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    loadAnimals()
  }

  inner class AnimalsAdapter(private val list: ArrayList<Animal>, private val context: Context) : BaseAdapter() {

    override fun getView(p0: Int, p1: View?, p2: ViewGroup?): View {
      val animal = list[p0]
      if (animal.isKiller == true) {
        val myView = layoutInflater.inflate(R.layout.animal_killer_ticket, null)
        myView.tvName.text = animal.name
        myView.txDesc.text = animal.des
        animal.image?.let { myView.ivAnimalImage.setImageResource(it) }
        myView.ivAnimalImage.setOnClickListener {
          val intent = Intent(context, AnimalInfoActivity::class.java)
          intent.putExtra("name", animal.name)
          intent.putExtra("des", animal.des)
          intent.putExtra("image", animal.image)
          startActivity(intent)
        }

        return myView
      }

      val myView = layoutInflater.inflate(R.layout.animal_ticket, null)
      myView.tvName.text = animal.name
      myView.txDesc.text = animal.des
      animal.image?.let { myView.ivAnimalImage.setImageResource(it) }
      myView.ivAnimalImage.setOnClickListener {
        val intent = Intent(context, AnimalInfoActivity::class.java)
        intent.putExtra("name", animal.name)
        intent.putExtra("des", animal.des)
        intent.putExtra("image", animal.image)
        startActivity(intent)
      }

      return myView
    }

    override fun getItem(p0: Int): Any {
      return list[p0]
    }

    override fun getItemId(p0: Int): Long {
      return p0.toLong()
    }

    override fun getCount(): Int {
      return list.size
    }

  }
}
