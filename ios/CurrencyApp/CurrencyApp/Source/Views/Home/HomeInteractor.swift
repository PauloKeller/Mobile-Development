//
//  HomeInteractor.swift
//  CurrencyApp
//
//  Created by paulo on 02/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation

class HomeInteractor {
    let repository = CurrencyRepository.sharedInstance
    
    /// Envia uma solicitacao (assumindo que todos os prerequisitos foram cumpridos).
    /// - Parameter forceFetch: Flag para forcar a busca por novas cotacoes.
    /// - Parameter completion: Completion handler.
    /// - Parameter model: Os dados de retorno da solicitacao.
    /// - Parameter msg: Mensagem de errro (se houver algum).
    func retrieveQuotes(forceFetch: Bool = false, completion: @escaping (_ model: [QuoteModel]?, _ msg: String?) -> Void) {
        repository.retrieveQuotes(forceFetch: forceFetch) { (model, msg) in
            completion(model, msg)
        }
    }
    
    /// Envia uma solicitacao (assumindo que todos os prerequisitos foram cumpridos).
    /// - Parameter filteredBy: `String` para filtrar as moedas.
    /// - Parameter completion: Completion handler.
    /// - Parameter model: Os dados de retorno da solicitacao.
    /// - Parameter msg: Mensagem de errro (se houver algum).
    func retrieveCurrencies(filteredBy query: String? = nil, completion: @escaping (_ model: [CurrencyModel]?, _ msg: String?) -> Void) {
        repository.retrieveCurrencies(filteredBy: query) { (model, msg) in
            completion(model, msg)
        }
    }
}
