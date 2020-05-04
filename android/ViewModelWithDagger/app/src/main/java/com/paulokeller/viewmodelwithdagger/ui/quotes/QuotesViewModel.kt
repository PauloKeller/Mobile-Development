package com.paulokeller.viewmodelwithdagger.ui.quotes

import androidx.lifecycle.ViewModel
import com.paulokeller.viewmodelwithdagger.data.model.Quote
import com.paulokeller.viewmodelwithdagger.data.repository.QuoteRepository


class QuotesViewModel(private val quoteRepository: QuoteRepository) : ViewModel() {

    fun addQuote(quote: Quote) = quoteRepository.addQuote(quote)

    fun getQuotes() = quoteRepository.getQuotes()
}