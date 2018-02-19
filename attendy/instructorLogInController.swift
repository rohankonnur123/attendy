//
//  instructorLogInController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/14/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit


class instructorLogInController: UIViewController {
    
    @IBOutlet weak var instructorToParticipation: UIButton!
    @IBOutlet weak var instructorEmailText: UITextField!
    @IBOutlet weak var instructorPasswordText: UITextField!

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
        let instructorEmail = instructorEmailText.text;
        let instructorPassword = instructorPasswordText.text;
        
        let instructorEmailStored = UserDefaults.standard.string(forKey: "instructorEmail");
        let instructorPasswordStored = UserDefaults.standard.string(forKey: "instructorPassword");
        
        if(instructorEmail == instructorEmailStored) {
            if(instructorPassword == instructorPasswordStored){
//                UserDefaults.standard.set(true,forKey: "isUserLoggedIn");
//                UserDefaults.standard.synchronize();
                self.performSegue(withIdentifier: "instructorToParticipationSegue", sender: self)
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
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
    
    @IBAction func instructorLogInReturnButtonClick() {
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
