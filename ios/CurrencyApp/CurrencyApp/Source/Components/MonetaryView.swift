//
//  MonetaryView.swift
//  CurrencyApp
//
//  Created by paulo on 04/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

class MonetaryView: UIView {
    var integerValue: String? {
        didSet {
            guard let value = integerValue else { return }
            integerValueLabel.text = value
        }
    }
    
    var decimalValue: String? {
        didSet {
            guard let value = decimalValue else { return }
            decimalValueLabel.text = value
        }
    }
    
    fileprivate lazy var quoteContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func configQuoteContainer() {
        self.addSubview(quoteContainer)
        
        NSLayoutConstraint.activate([
            quoteContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quoteContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            quoteContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            quoteContainer.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate lazy var decimalValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.numberOfLines = 0
        return label
    }()
    
    private func configDecimalValueLabel() {
        quoteContainer.addSubview(decimalValueLabel)
        let width = self.frame.width / 2
        NSLayoutConstraint.activate([
            decimalValueLabel.topAnchor.constraint(equalTo: quoteContainer.topAnchor),
            decimalValueLabel.widthAnchor.constraint(equalToConstant: width),
            decimalValueLabel.trailingAnchor.constraint(equalTo: quoteContainer.trailingAnchor),
            decimalValueLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    fileprivate lazy var integerValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.font = label.font.withSize(50)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    private func configIntegerValueLabel() {
        quoteContainer.addSubview(integerValueLabel)
        NSLayoutConstraint.activate([
            integerValueLabel.topAnchor.constraint(equalTo: quoteContainer.topAnchor),
            integerValueLabel.leadingAnchor.constraint(equalTo: quoteContainer.leadingAnchor),
            integerValueLabel.trailingAnchor.constraint(equalTo: decimalValueLabel.leadingAnchor),
            integerValueLabel.bottomAnchor.constraint(equalTo: quoteContainer.bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        configQuoteContainer()
        configDecimalValueLabel()
        configIntegerValueLabel()
    }
}
