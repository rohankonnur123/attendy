//
//  ViewController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/14/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var instructionsButton: UIButton!
    @IBOutlet weak var instructorLogInButton: UIButton!
    @IBOutlet weak var studentLogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func instructionButtonClick() {
        // do something
        print("clicked instructions")
        self.performSegue(withIdentifier: "instructionSegue", sender: self)
    }
    
    @IBAction func instructorLogInButtonClick() {
        // do something
        print("clicked instructor log in")
        self.performSegue(withIdentifier: "instructorLogInSegue", sender: self)
    }
    
    @IBAction func studentLogInButtonClick() {
        // do something
        print("clicked student log in")
        self.performSegue(withIdentifier: "studentLogInSegue", sender: self)
    }
}

