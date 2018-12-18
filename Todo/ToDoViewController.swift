//
//  ViewController.swift
//  Todo
//
//  Created by viktoria holzmann on 17/12/2018.
//  Copyright © 2018 viktoria holzmann. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var things :[String] = []
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var selectedImage: UIImage?
    
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
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
     
       
        
        let alert = UIAlertController(title: "ADD NEW ITEM", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ADD ITEM", style: .default) { action in
        
            self.things.append(textfield.text!)
            self.tableView.reloadData()
            
        }
        
        alert.addTextField {(alertTextField) in
            alertTextField.placeholder = "hallo schreib was"
            textfield = alertTextField
          
        }
        
       
        let pictureAction = UIAlertAction(title: "ADD picture", style: .default) { action in
            
            let image = UIImagePickerController()
            image.delegate = self
            
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            
            image.allowsEditing = true
            
            self.present(image, animated: true)
            
         
        
        

        }
        
        alert.addAction(pictureAction)
        alert.addAction(action)
        present(alert, animated: true)
}
}

extension ToDoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           selectedImage = image
        }
        self.dismiss(animated: true, completion: nil)
    }

}
