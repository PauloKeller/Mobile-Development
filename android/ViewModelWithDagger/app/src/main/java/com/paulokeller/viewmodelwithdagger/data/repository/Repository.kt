package com.paulokeller.viewmodelwithdagger.data.repository

import androidx.lifecycle.LiveData
import com.paulokeller.viewmodelwithdagger.data.model.Quote

interface QuoteRepository {
    fun addQuote(quote: Quote)
    fun getQuotes(): LiveData<List<Quote>>
}