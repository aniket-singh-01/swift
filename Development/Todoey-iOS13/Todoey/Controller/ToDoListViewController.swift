//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController:  UITableViewController {
    
    var todoItems: Results<Item>?
    let realm=try! Realm()
    var selectedCategory : Category?{
        didSet{
            loadItem()
        }
    }
    
    
    
    let defaults=UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        
    }
    
    
    override func tableView(_ tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if let item=todoItems?[indexPath.row]{
            cell.textLabel?.text=item.title
            
            cell.accessoryType=item.done ? .checkmark : .none
        }
        else{
            cell.textLabel?.text="No Items Added"
        }
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item=todoItems?[indexPath.row]{
            do{
                try realm.write{
                    item.done = !item.done
//                    realm.delete(item)
                }
            }
            catch{
                print("Error saving status")
            }
            
        }
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField=UITextField()
        
        let alert=UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action=UIAlertAction(title: "Add Item", style: .default){
            (action) in
            
            if let currentCategory=self.selectedCategory{
                do{
                    try self.realm.write{
                        let newitem=Item()
                        newitem.title=textField.text!
                        newitem.dateCreated=Date()
                        currentCategory.items.append(newitem)
                    }
                    
                }
                catch{
                    print("Error saving new items, \(error)")
                }
            }
            
            self.tableView.reloadData()
            
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder="Create New Items"
            textField=alertTextField
            
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    
    func loadItem(){
        
        todoItems=selectedCategory?.items.sorted(byKeyPath: "title",ascending: true)
        
    }
    //
    //
}
extension ToDoListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        todoItems=todoItems?.filter("title CONTAINS[cd] %@", searchBar.text).sorted(byKeyPath: "dateCreated",ascending: true)
        tableView.reloadData()
    }

    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count==0{
              loadItem()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        }
    }
}
