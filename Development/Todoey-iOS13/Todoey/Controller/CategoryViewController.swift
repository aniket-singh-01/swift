//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Aniket Singh on 21/01/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm=try! Realm()
    
    var categories: Results<Category>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }
    
    // MARK: -TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1       //Nil coalesing operator
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category=categories?[indexPath.row]
        
        cell.textLabel?.text=category?.name ?? "No categories added yet"
        
        return cell
    }
    // MARK: -TableView Delegate Methods
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC=segue.destination as! ToDoListViewController
        
        if let indexPath=tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory=categories?[indexPath.row]
        }
        
    }
    
    // MARK: -Data Manipulation Methods
    
    func save(category: Category){
        do{
            try realm.write{
                realm.add(category)
            }
        }
        catch{
            print("error,\(error)")
        }
    }
    
    func loadCategories(){
        
        categories=realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
     
    // MARK: -Add new Categories



    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField=UITextField()
        
        let alert=UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action=UIAlertAction(title: "Add ", style: .default){
            (action) in
            
            let newCategory=Category()
            newCategory.name=textField.text!
         
            self.save(category: newCategory)
            //            self.defaults.set(self.items, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
        }
        alert.addTextField { (field) in
            textField=field
            textField.placeholder="Add a new Category"
            
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
    }
    
  
}
