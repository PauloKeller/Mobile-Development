//
//  HomeRouter.swift
//  CurrencyApp
//
//  Created by paulo on 07/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation

class HomeRouter {
    private var view: HomeViewController
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func navigateCurrencyToDetails(currency: CurrencyModel, quote: QuoteModel) {
        let viewController = CurrencyDetailsViewController()
        viewController.currency = currency
        viewController.quote = quote
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToEditPreferences(currencies: [CurrencyModel]) {
        let viewController = EditPreferencesViewController()
        viewController.currencies = currencies
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
