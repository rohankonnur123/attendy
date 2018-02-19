//
//  studentParticipation.swift
//  attendy
//
//  Created by Rohan Konnur on 2/14/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
var points = 0

class studentParticipationController: UIViewController {
    
    @IBOutlet weak var participationButton: UIButton!
    @IBOutlet weak var participationCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        participationCounter.text = formatCounter()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func participationButtonPress(_ sender: Any) {
        
        //insert alert for button press to confirm participation request
        displayMyAlertMessage()
        
    }
    
    func formatCounter() -> String {
        return String(format:"Points: %01i", points)
    }
    
    func displayMyAlertMessage() {
        
        let alert = UIAlertController(title: "Confirm?", message: "Confirm Participation?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(nil) in
            points += 1
            self.post()
            let txt = self.formatCounter()
            self.participationCounter.text = txt
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func post() {
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        let name = userEmailStored
        
        let databaseRef = Database.database().reference()
//        let randomKey = databaseRef.child("IEOR 171 Class Participation").childByAutoId().key
        
//        let post : [String : Any] = ["name": name as Any, "points": points]
//        databaseRef.child("IEOR 171 Class Participation").childByAutoId().setValue(post)
        
        let randomKey = databaseRef.child("IEOR 171 Class Participation").childByAutoId().key
        let user = ["name": name as Any,
                     "points": points,
                     "key": randomKey] as [String : Any]
        let childUpdates = ["/IEOR 171 Class Participation/\(randomKey)": user]
        databaseRef.updateChildValues(childUpdates)
        points = user["points"] as! Int
    }
    
}
