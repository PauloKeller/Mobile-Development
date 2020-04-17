package com.paulokeller.roomex

import androidx.lifecycle.ViewModelProviders
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.main_fragment.*
import java.util.*


class MainFragment : Fragment() {
    private var adapter: ProductListAdapter? = null

    companion object {
        fun newInstance() = MainFragment()
    }

    private lateinit var viewModel: MainViewModel

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.main_fragment, container, false)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        viewModel = ViewModelProviders.of(this).get(MainViewModel::class.java)

        listenerSetup()
        observerSetup()
        recyclerSetup()
    }

    private fun listenerSetup() {
        addButton.setOnClickListener {
            val name = productName.text.toString()
            val quantity = productQuantity.text.toString()

            if (name != "" && quantity != "") {
                val product = Product(name, Integer.parseInt(quantity))
                viewModel.insertProduct(product)
                clearFields()
            } else {
                productID.text = "Incomplete information"
            }
        }

        findButton.setOnClickListener { viewModel.findProduct(productName.text.toString()) }

        deleteButton.setOnClickListener {
            viewModel.deleteProduct(productName.text.toString())
            clearFields()
        }
    }

    private fun observerSetup() {
        viewModel.getAllProducts()?.observe(this, Observer { products ->
            products?.let {
                adapter?.setProductList(it)
            }
        })
        viewModel.getSearchResults().observe(this, Observer { products ->products?.let {
            if (it.isNotEmpty()) {
                productID.text = String.format(Locale.US, "%d", it[0].id)
                productName.setText(it[0].productName)
                productQuantity.setText(String.format(
                    Locale.US, "%d",
                    it[0].quantity))
            } else {
                productID.text = "No Match"
            }
        }
        })
    }

    private fun recyclerSetup() {
        adapter = ProductListAdapter(R.layout.product_list_item)
        val recyclerView: RecyclerView? = view?.findViewById(R.id.product_recycler)
        recyclerView?.layoutManager = LinearLayoutManager(context)
        recyclerView?.adapter = adapter
    }

    private fun clearFields() {
        productID.text = ""
        productName.setText("")
        productQuantity.setText("")
    }

}
