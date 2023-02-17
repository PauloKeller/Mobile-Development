//
//  HomePresenter.swift
//  CurrencyApp
//
//  Created by paulo on 01/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation

class HomePresenter {
    private let interactor = HomeInteractor()
    private let view: HomeViewController
    private let router: HomeRouter
    
    var quotes: [QuoteModel]?
    var currencies: [CurrencyModel]?
    
    init(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
    }
    
    /// Faz a solicitacao para retornar as cotacoes das moedas.
    /// - Parameter forceFetch: Forca o comportamento de busca na API.
    func retrieveQuotes(forceFetch: Bool = false) -> Void {
        interactor.retrieveQuotes(forceFetch: forceFetch) { (model, msg) in
            self.quotes = model
        }
    }
    
    /// Faz a solicitacao para retornar as moedas.
    /// - Parameter query: Query `String` para filtrar as moedas.
    func retrieveCurrencies(with query: String? = nil) -> Void {
        interactor.retrieveCurrencies(filteredBy: query) { (model, msg) in
            self.currencies = model
            self.view.updateCollectionData()
        }
    }
    
    private func navigateToCurrencyDetails(currency: CurrencyModel, quote: QuoteModel) -> Void {
        router.navigateCurrencyToDetails(currency: currency, quote: quote)
    }
    
    private func navigateToEditPreferences(currencies: [CurrencyModel]) -> Void {
        router.navigateToEditPreferences(currencies: currencies)
    }
    
    /// Faz a selecao da moeda e navega para a tela de detalhes.
    /// - Parameter index: Index da moeda que foi selecionada.
    func selectCurrencyDetails(for index:Int) -> Void {
        if let currency = currencies?[index], let quotes = quotes {
            for quote in quotes {
                if quote.initials.contains(currency.initials) {
                    navigateToCurrencyDetails(currency: currency, quote: quote)
                }
            }
        }
    }
    
    /// Navega para a tela de preferencias.
    func editPreferences() -> Void {
        if let data = currencies {
            navigateToEditPreferences(currencies: data)
        }
    }
}
