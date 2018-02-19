//
//  instructorRegistrationController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/16/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit

class instructorRegistrationController: UIViewController {
    
    @IBOutlet weak var instructorEmailText: UITextField!
    @IBOutlet weak var instructorPasswordText: UITextField!
    @IBOutlet weak var instructorConfirmPasswordText: UITextField!
    @IBOutlet weak var instructorSecretKeyText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureKeyboard()
    }
    
    func configureKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(sender: AnyObject) {
        let instructorEmail = instructorEmailText.text;
        let instructorPassword = instructorPasswordText.text;
        let instructorConfirmPassword = instructorConfirmPasswordText.text;
        let instructorSecretKey = instructorSecretKeyText.text;
        
        if((instructorEmail?.isEmpty)! || (instructorPassword?.isEmpty)! || (instructorConfirmPassword?.isEmpty)! || (instructorSecretKey?.isEmpty)!) {
            
            displayMyAlertMessage(userMessage: "All fields are required!")
            return;
        }
        
        if(instructorPassword != instructorConfirmPassword) {
            
            displayMyAlertMessage(userMessage: "Passwords do not match!")
            return;
        }
        
        if(instructorSecretKey != "rohankonnur") {
            displayMyAlertMessage(userMessage: "You must authenticate as an instructor!")
            return;
        }
        
        UserDefaults.standard.set(instructorEmail, forKey: "instructorEmail");
        UserDefaults.standard.set(instructorPassword, forKey: "instructorPassword");
        UserDefaults.standard.synchronize();
        
        let myAlert = UIAlertController(title: "Alert", message:"Registration Successful!", preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
            self.dismiss(animated: true,completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
        
    }
    
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
    
}
