//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by paulo on 07/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    var categoryArray = [ItemCategory]()
    var category = ""
    let categoryCellIdentifier = "CategoryCell"
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier, for: indexPath)
           let category = categoryArray[indexPath.row]
           
           cell.textLabel?.text = category.name
           
           return cell
       }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryArray[indexPath.row]
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }

    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
          var textField = UITextField()
          
          let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
          
          let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
              if let name = textField.text {
                  let category = ItemCategory(context: self.context)
                  category.name = name
                 
                  self.categoryArray.append(category)
                  self.saveCategories()
              }
          }
          
          alert.addTextField { (alertTextField) in
              alertTextField.placeholder = "Create category"
              textField = alertTextField
          }
          alert.addAction(action)
          
          present(alert, animated: true, completion: nil)
      }
    
    //MARK: - Data Manipulation Code
    func saveCategories() {
        do  {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadCategories(with request:NSFetchRequest<ItemCategory> = ItemCategory.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }
}
