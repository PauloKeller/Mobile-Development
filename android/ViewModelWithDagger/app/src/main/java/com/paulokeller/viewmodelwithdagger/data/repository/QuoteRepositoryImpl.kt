package com.paulokeller.viewmodelwithdagger.data.repository

import com.paulokeller.viewmodelwithdagger.data.db.QuoteDao
import com.paulokeller.viewmodelwithdagger.data.model.Quote

class QuoteRepositoryImpl(private val quoteDao: QuoteDao)
    : QuoteRepository {
    override fun addQuote(quote: Quote) {
        quoteDao.addQuote(quote)
    }

    override fun getQuotes() = quoteDao.getQuotes()
}