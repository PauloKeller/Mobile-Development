//
//  EditPreferencesViewController.swift
//  CurrencyApp
//
//  Created by paulo on 07/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

/// Tela responsavel por editar as preferencias de busca por moedas.
class EditPreferencesViewController: UIViewController {
    #warning("TODO move logic to presenter")
    private var amoutToConvert: Float = 0.0
    private var selectedCurrency: CurrencyModel?
    var currencies: [CurrencyModel] = []
    
    fileprivate lazy var currencyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private func configCurrencyPicker() {
        self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
        
        view.addSubview(currencyPicker)
        
        let padding = CGFloat(20)
        
        NSLayoutConstraint.activate([
            currencyPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            currencyPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            currencyPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            currencyPicker.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    fileprivate lazy var currencyValueField: UITextField = {
        let field = UITextField()
        field.placeholder = "\(amoutToConvert)"
        field.textAlignment = .center
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func configValueField() {
        view.addSubview(currencyValueField)
        
        let padding = CGFloat(10)
        
        NSLayoutConstraint.activate([
            currencyValueField.bottomAnchor.constraint(equalTo: currencyPicker.topAnchor, constant: -padding),
            currencyValueField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            currencyValueField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            currencyValueField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    fileprivate lazy var currencyValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Choose a monetary value to convert"
        return label
    }()
    
    private func configCurrencyValueLabel() {
        view.addSubview(currencyValueLabel)
        
        let padding = CGFloat(10)
        
        NSLayoutConstraint.activate([
            currencyValueLabel.bottomAnchor.constraint(equalTo: currencyValueField.topAnchor, constant: -padding),
            currencyValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            currencyValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            currencyValueLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc private func doneEditTapped() {
        #warning("TODO Create validation")
        guard let text = currencyValueLabel.text, let value = Float(text), let currency = selectedCurrency else { return }
        amoutToConvert = value
        print(currency)
    }
    
    private func configView() {
        view.backgroundColor = .white
        title = "Pick a currency"
        
        let doneEdit = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneEditTapped))
        self.navigationItem.rightBarButtonItem = doneEdit
        
        configCurrencyPicker()
        configValueField()
        configCurrencyValueLabel()
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
}

// MARK: - PickerView Delegate Methods
extension EditPreferencesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row].initials
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = currencies[row]
        title = "\(selectedCurrency?.name ?? "")"
    }
}
