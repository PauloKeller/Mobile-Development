package com.paulokeller.viewmodelwithdagger

import android.app.Application
import com.paulokeller.viewmodelwithdagger.data.db.Database
import com.paulokeller.viewmodelwithdagger.data.db.DatabaseFakeImpl
import com.paulokeller.viewmodelwithdagger.data.db.QuoteDao
import com.paulokeller.viewmodelwithdagger.data.repository.QuoteRepository
import com.paulokeller.viewmodelwithdagger.data.repository.QuoteRepositoryImpl
import com.paulokeller.viewmodelwithdagger.ui.quotes.QuotesViewModelFactory
import org.kodein.di.Kodein
import org.kodein.di.KodeinAware
import org.kodein.di.generic.bind
import org.kodein.di.generic.instance
import org.kodein.di.generic.provider
import org.kodein.di.generic.singleton


class QuotesApplication : Application(), KodeinAware {
    override val kodein = Kodein.lazy {
        bind<Database>() with singleton { DatabaseFakeImpl() }
        bind<QuoteDao>() with singleton { instance<Database>().quoteDao }
        bind<QuoteRepository>() with singleton { QuoteRepositoryImpl(instance()) }
        bind() from provider { QuotesViewModelFactory(instance()) }
    }
}