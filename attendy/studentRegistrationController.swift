//
//  studentRegistrationController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/15/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit


class studentRegistrationController: UIViewController {
    
    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var userConfirmPasswordText: UITextField!
    @IBOutlet weak var userStudentIDText: UITextField!

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
        let userEmail = userEmailText.text;
        let userPassword = userPasswordText.text;
        let userConfirmPassword = userConfirmPasswordText.text;
        let userID = userStudentIDText.text;
        
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userConfirmPassword?.isEmpty)! || (userID?.isEmpty)!) {
            
            displayMyAlertMessage(userMessage: "All fields are required!")
            return;
        }
        
        if(userPassword != userConfirmPassword) {
            
            displayMyAlertMessage(userMessage: "Passwords do not match!")
            return;
        }
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail");
        UserDefaults.standard.set(userPassword, forKey: "userPassword");
        UserDefaults.standard.set(userID, forKey: "userID");
        UserDefaults.standard.synchronize();
        
        let myAlert = UIAlertController(title: "Alert", message:"Registration Successful!", preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
            self.dismiss(animated: true,completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
        points = 0
        
    }
    
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
    
}








