//
//  tableListViewController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/15/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


class tableListViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var refHandle: UInt!
    var userList = [User]()
    
    let cellId =  "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        fetchUsers()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        // Set cell contents
        cell.textLabel?.text = userList[indexPath.row].name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let impKey = userList[indexPath.row].key
            userList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            remove(parentA: impKey!)
            points -= 1
        }
    }
    
    
    func remove(parentA: String) {
        let remref = ref.child("IEOR 171 Class Participation").child(parentA)
        
        remref.removeValue { error, _ in
            
            print(error as Any)
        }
    }
    
    
    func fetchUsers(){
        refHandle = ref.child("IEOR 171 Class Participation").observe(.childAdded, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                print(dictionary)
                
                let user = User()
                user.name = dictionary["name"] as? String
                user.points = dictionary["points"] as? Int
                user.key = dictionary["key"] as? String
                self.userList.append(user)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        })
    }
}
