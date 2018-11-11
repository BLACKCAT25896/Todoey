//
//  ViewController.swift
//  Todoey
//
//  Created by Kamrujjaman on 10/27/18.
//  Copyright © 2018 Kamrujjaman. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    var itemArray = [Item]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        loadItems()
        
    }
    //MARK - Table View Datasource Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell",for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }
    //MARK - TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Item
    
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todeoy Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen here once user will click our UITodeoy system
           
          
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
            
            self.saveItems()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK - Model Manupulation Data
    
    func saveItems()  {
        
        
        do{
            try context.save()
            
        }catch{
            print("Error saving context, \(error)")
            
        }
        self.tableView.reloadData()
        
    }
    
    func loadItems()  {

        let request :NSFetchRequest<Item> = Item.fetchRequest()
        
        do{
            
            itemArray = try context.fetch(request)
        }catch{
            print("Error with fetch request \(error)")
        }

    }
}

