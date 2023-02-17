//
//  HomeViewController.swift
//  CurrencyApp
//
//  Created by paulo on 01/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

/// Tela responsavel por apresentar os cards contendo as informações das moedas.
class HomeViewController: UIViewController {
    var presenter: HomePresenter?
    
    fileprivate lazy var currencySearchBar:UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "United States Dollar"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        return searchBar
    }()
    
    fileprivate lazy var currenciesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.register(CurrencyCell.self, forCellWithReuseIdentifier: CurrencyCell.identifier)
        return collection
    }()
    
    func configCurrenciesCollectionView() {
        currenciesCollectionView.delegate = self
        currenciesCollectionView.dataSource = self
        
        view.addSubview(currenciesCollectionView)
        NSLayoutConstraint.activate([
            currenciesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            currenciesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currenciesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currenciesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func editPreferencesTapped() {
        presenter?.editPreferences()
    }
    
    private func configView() {
        navigationItem.titleView = currencySearchBar
        let editCurrencies = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editPreferencesTapped))
        self.navigationItem.rightBarButtonItem = editCurrencies
        
        configCurrenciesCollectionView()
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        let router = HomeRouter(view: self)
        presenter = HomePresenter(view: self, router: router)
        super.viewDidLoad()
        
        configView()

        presenter?.retrieveQuotes()
        presenter?.retrieveCurrencies()
    }
    
    func updateCollectionData() {
        currenciesCollectionView.reloadData()
    }
}

// MARK: - SearchBar Delegate Methods
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        presenter?.retrieveCurrencies(with: text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            presenter?.retrieveCurrencies()
            currenciesCollectionView.reloadData()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

// MARK: - UIViewController Delegate Methods
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width / 2.2
        let itemHeight = collectionView.frame.width / 2
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.currencies?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrencyCell.identifier, for: indexPath) as? CurrencyCell else {
            fatalError("The registered type for the cell does not match the casting")
        }
        cell.data = presenter?.currencies?[indexPath.row]
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.selectCurrencyDetails(for: indexPath.row)
    }
}
