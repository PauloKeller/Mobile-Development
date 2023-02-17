//
//  CurrencyDetailsViewController.swift
//  CurrencyApp
//
//  Created by paulo on 04/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

/// Tela responsavel por apresentar os detalhes de uma moeda.
class CurrencyDetailsViewController: UIViewController {
    var currency: CurrencyModel? {
        didSet {
            guard let data = currency else { return }
            title = data.name
        }
    }
    
    var amoutToConvert: Float = 01.00
    
    var quote: QuoteModel? {
        didSet {
            guard let data = quote, let quoteValue = quote?.value else { return }
            convertedCurrency.text = "Converted to \(data.initials)"
            let unixTimestamp = NSDate(timeIntervalSince1970: TimeInterval(quote?.lastQuotation ?? 0))
            lastQuotationDateLabel.text = "Last update: \(unixTimestamp)"
            
            let quoteStringValue = String(quoteValue).splitDecimal()
            selectedMonetaryView.integerValue = quoteStringValue.integerValue
            selectedMonetaryView.decimalValue = quoteStringValue.decimalValue
            
            let totalAmount = amoutToConvert * quoteValue
            let totalStringAmount = String(totalAmount).splitDecimal()
            convertedMonetaryView.integerValue = totalStringAmount.integerValue
            convertedMonetaryView.decimalValue = totalStringAmount.decimalValue
        }
    }
    
    fileprivate lazy var selectedCurrency: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quoted on"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    func configSelectedCurrency() -> Void {
        view.addSubview(selectedCurrency)
        
        NSLayoutConstraint.activate([
            selectedCurrency.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5),
            selectedCurrency.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 5),
            selectedCurrency.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectedCurrency.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    fileprivate lazy var selectedMonetaryView: MonetaryView = {
        let view = MonetaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func configSelectedMonetaryViewContainer() {
        view.addSubview(selectedMonetaryView)
        
        NSLayoutConstraint.activate([
            selectedMonetaryView.topAnchor.constraint(equalTo: selectedCurrency.bottomAnchor, constant: 10),
            selectedMonetaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectedMonetaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectedMonetaryView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate lazy var convertedCurrency: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Converted to None"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    func configConvertedCurrency() -> Void {
        view.addSubview(convertedCurrency)
        
        NSLayoutConstraint.activate([
            convertedCurrency.topAnchor.constraint(equalTo: selectedMonetaryView.bottomAnchor, constant: 10),
            convertedCurrency.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            convertedCurrency.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            convertedCurrency.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    fileprivate lazy var convertedMonetaryView: MonetaryView = {
        let view = MonetaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func configConvertedMonetaryViewContainer() {
        view.addSubview(convertedMonetaryView)
        
        NSLayoutConstraint.activate([
            convertedMonetaryView.topAnchor.constraint(equalTo: convertedCurrency.bottomAnchor, constant: 10),
            convertedMonetaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            convertedMonetaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            convertedMonetaryView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate lazy var lastQuotationDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "Last update: 01/01/1990 - 10:30:20"
        label.numberOfLines = 0
        return label
    }()
    
    private func configLastQuotationDate() {
        view.addSubview(lastQuotationDateLabel)
        
        NSLayoutConstraint.activate([
            lastQuotationDateLabel.topAnchor.constraint(equalTo: convertedMonetaryView.bottomAnchor),
            lastQuotationDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastQuotationDateLabel.heightAnchor.constraint(equalToConstant: 40),
            lastQuotationDateLabel.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
    
    private func configView() {
        configSelectedCurrency()
        configSelectedMonetaryViewContainer()
        configConvertedCurrency()
        configConvertedMonetaryViewContainer()
        configLastQuotationDate()
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configView()
    }
}
