//
//  instructionsController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/14/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit


class instructionsController: UIViewController {
    
    @IBOutlet weak var instructionReturnButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func instructionReturnButtonClick() {
        // do something
        print("return clicked")
//        self.performSegue(withIdentifier: "instructionReturnSegue", sender: self)
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
