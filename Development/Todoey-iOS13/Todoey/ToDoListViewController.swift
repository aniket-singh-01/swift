//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoListViewController:  UITableViewController {
    
   
    
    var items=["ak","afad","aj"]
    
    let defaults=UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = defaults.array(forKey: "ToDoListArray") as? [String]{
            items = item
        }
        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(_ tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        cell.textLabel?.text=items[indexPath.row]
       return cell
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        print(items[indexPath.row])
         
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
 
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField=UITextField()
        
        let alert=UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action=UIAlertAction(title: "Add Item", style: .default){
            (action) in
            
            self.items.append(textField.text!)
            
            self.defaults.set(self.items, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder="Create New Items"
            textField=alertTextField
            
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    

}

