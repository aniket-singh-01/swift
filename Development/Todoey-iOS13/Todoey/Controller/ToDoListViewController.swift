//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController:  UITableViewController {
    
    var itemArray = [Item]()
    
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let defaults=UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadItem()
    }
    
    
    override func tableView(_ tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item=itemArray[indexPath.row]
        
        cell.textLabel?.text=item.title
        
        cell.accessoryType=item.done ? .checkmark : .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Toggle the 'done' property of the selected item
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // Save the changes to persistent storage
        saveItems()
        
        // Reload only the selected row to update the checkmark visually
        tableView.reloadRows(at: [indexPath], with: .none)
        
        // Deselect the row after it's tapped for a better user experience
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField=UITextField()
        
        let alert=UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action=UIAlertAction(title: "Add Item", style: .default){
            (action) in
            
            
            
            let newitem=Item(context: self.context)
            newitem.title=textField.text!
            newitem.done=false
            
            self.itemArray.append(newitem)
            self.saveItems()
            //            self.defaults.set(self.items, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder="Create New Items"
            textField=alertTextField
            
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    func saveItems(){
        
        do{
            try context.save()
        }
        catch{
            print("error,\(error)")
        }
    }
    
    
    func loadItem(with request: NSFetchRequest<Item>=Item.fetchRequest()){
        
        //        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do{
            itemArray = try context.fetch(request)
        }
        catch{
            print("Error fetching \(error)")
        }
        tableView.reloadData()
        
    }
    //
    //
}
extension ToDoListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request:NSFetchRequest<Item> = Item.fetchRequest()
        let predicate=NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.predicate=predicate
        
        request.sortDescriptors=[NSSortDescriptor(key: "title", ascending: true)]
        
        loadItem(with: request)
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
