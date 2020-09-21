//
//  CurrencyCell.swift
//  CurrencyApp
//
//  Created by paulo on 02/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

class CurrencyCell: UICollectionViewCell {
    static let identifier = "CurrencyCell"
    var data: CurrencyModel? {
        didSet {
            guard let data = data else { return }
            currencyInitialsLabel.text = data.initials
            currencyNameLabel.text = data.name
        }
    }
    
    fileprivate lazy var cardView: CardView = {
        let card = CardView()
        card.cornerRadius = 10
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .white
        return card
    }()
    
    private func configCardView() {
        contentView.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    fileprivate lazy var currencyNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 4
        label.textAlignment = .center
        label.text = "None"
        return label
    }()
    
    private func configCurrencyNameLabel() {
        cardView.addSubview(currencyNameLabel)
        
        let padding = CGFloat(5)
        NSLayoutConstraint.activate([
            currencyNameLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            currencyNameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            currencyNameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
            currencyNameLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    fileprivate lazy var currencyInitialsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "None"
        label.numberOfLines = 0
        return label
    }()
    
    private func configCurrencyInitialsLabel() {
        cardView.addSubview(currencyInitialsLabel)
        
        let padding = CGFloat(5)
        NSLayoutConstraint.activate([
            currencyInitialsLabel.bottomAnchor.constraint(equalTo: currencyNameLabel.topAnchor, constant: padding),
            currencyInitialsLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            currencyInitialsLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
            currencyInitialsLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCardView()
        configCurrencyNameLabel()
        configCurrencyInitialsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
