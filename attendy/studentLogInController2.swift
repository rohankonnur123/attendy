//
//  studentLogInController2.swift
//  attendy
//
//  Created by Rohan Konnur on 2/18/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit


class studentLogInController2: UIViewController {
    
    @IBOutlet weak var studentToParticipation: UIButton!
    @IBOutlet weak var studentEmailText: UITextField!
    @IBOutlet weak var studentPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureKeyboard();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBAction func instructorLogInButton() {
        let studentEmail = studentEmailText.text;
        let studentPassword = studentPasswordText.text;
        
        let studentEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        let studentPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
        if(studentEmail == studentEmailStored) {
            if(studentPassword == studentPasswordStored){
                //                UserDefaults.standard.set(true,forKey: "isUserLoggedIn");
                //                UserDefaults.standard.synchronize();
                self.performSegue(withIdentifier: "studentToParticipationSegue", sender: self)
            }
            else{
                displayMyAlertMessage(userMessage: "Incorrect Password. Try Again.");
            }
        }
        else {
            displayMyAlertMessage(userMessage: "Incorrect Username. Try Again.");
        }
    }
    
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Student Log-In Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
    
    @IBAction func studentLogInReturnButtonClick() {
        // do something
        print("return from instructor log in")
        performSegueToReturnBack()
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
