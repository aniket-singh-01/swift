//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Aniket Singh on 21/01/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class CategoryViewController: UITableViewController {
    
    let realm=try! Realm()
    
    var categories: Results<Category>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight=80.0
        loadCategories()

    }
    
    // MARK: -TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1       //Nil coalesing operator
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
//        cell.delegate = self
//        return cell
//    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        
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

//MARK: - SwipeTableViewCellDelegate

extension CategoryViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            if let categoryForDeletion=self.categories?[indexPath.row]{
                
                do{
                    try self.realm.write{
                        self.realm.delete(categoryForDeletion)
                    }
                }catch{
                    print("ERROR DELETING")
                }
                
                
            }
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}
