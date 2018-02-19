//
//  tableViewController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/15/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


//struct postStruct {
//    let title : String!
//    let message : String!
//}


class tableViewController: UITableViewController {
    @IBOutlet var tableView: UITableView!
    
    var ref: DatabaseReference
    
    //    var posts = [postStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let databaseRef = Database.database().reference()
//
//        databaseRef.child("IEOR 171 Class Participation").queryOrderedByKey().observe(.childAdded, with: {(snapshot) in
//            let title = snapshot.value as? String
//            let message = snapshot.value as? String
//            self.posts.insert(postStruct(title: title, message: message), at: 0)
//            self.tableView.reloadData()
//        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//
//        let label1 = cell?.viewWithTag(1) as! UILabel
//        label1.text = posts[indexPath.row].title
//        let label2 = cell?.viewWithTag(2) as! UILabel
//        label2.text = posts[indexPath.row].message
//
//        return cell!
//    }
    
}
