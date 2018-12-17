//
//  ViewController.swift
//  Todo
//
//  Created by viktoria holzmann on 17/12/2018.
//  Copyright © 2018 viktoria holzmann. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController{

    let things = ["TEE", "KAFFEE", "MILCH"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = things[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print (things[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
              tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
              tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
  
   
    
}

