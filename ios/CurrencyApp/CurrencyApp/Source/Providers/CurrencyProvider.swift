//
//  CurrencyProvider.swift
//  CurrencyApp
//
//  Created by paulo on 01/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation
import Alamofire

/// Servico de moedas.
protocol CurrencyService {
    /// Faz uma consulta das moedas.
    /// - Parameter request: Dados da solicitacao.
    /// - Parameter completion: Completion handler.
    /// - Parameter model: Objeto contendo as informações.
    /// - Parameter msg: Mensagem de errro (se houver algum).
    /// - Parameter wasSuccess: Se a requisicao foi feita com sucesso
    func fetchCurrencies(completion: @escaping (_ wasSuccess: Bool, _ model: FetchCurrenciesResponse?, _ msg: String?) -> Void) -> Void
    /// Faz uma consulta das cotacoes das moedas.
    /// - Parameter request: Dados da solicitacao.
    /// - Parameter completion: Completion handler.
    /// - Parameter model: Objeto contendo as informações.
    /// - Parameter msg: Mensagem de errro (se houver algum).
    /// - Parameter wasSuccess: Se a requisicao foi feita com sucesso
    func fetchQuotes(completion: @escaping (_ wasSuccess: Bool, _ model: FetchQuotesResponse?, _ msg: String?) -> Void) -> Void
}

/// Provedor de dados das moedas
class CurrencyProvider: CurrencyService {
    private let defaultMsg = "Não foi possível realizar a pesquisa."
    
    func fetchQuotes(completion: @escaping (_ wasSuccess: Bool, _ model: FetchQuotesResponse?, _ msg: String?) -> Void) -> Void {
        let url = Constants.apiHost + String(format: Constants.currenciesLivePath, Constants.apiKey)
        AF.request(url, method: .get).response {
            response in
            switch response.result {
            case .success(let data):
                #if DEBUG
                if let json = data, let JSONString = String(data: json, encoding: String.Encoding.utf8) {
                    print(JSONString)
                }
                #endif
                var result: FetchQuotesResponse?
                if let data = data, let model = try? JSONDecoder().decode(FetchQuotesResponse.self, from: data) {
                    result = model
                }
                completion(true, result, nil)
                break
            case .failure(let error):
                let msg = error.errorDescription ?? self.defaultMsg
                completion(false, nil, msg)
                break
            }
        }
    }
    
    func fetchCurrencies(completion: @escaping (_ wasSuccess: Bool, _ model: FetchCurrenciesResponse?, _ msg: String?) -> Void) -> Void {
        let url = Constants.apiHost + String(format: Constants.currenciesListPath, Constants.apiKey)
        AF.request(url, method: .get).response {
            response in
            switch response.result {
            case .success(let data):
                #if DEBUG
                if let json = data, let JSONString = String(data: json, encoding: String.Encoding.utf8) {
                    print(JSONString)
                }
                #endif
                var result: FetchCurrenciesResponse?
                if let data = data, let model = try? JSONDecoder().decode(FetchCurrenciesResponse.self, from: data) {
                    result = model
                }
                completion(true, result, nil)
                break
            case .failure(let error):
                let msg = error.errorDescription ?? self.defaultMsg
                completion(false, nil, msg)
                break
            }
        }
    }
}
