//
//  instructorQRController.swift
//  attendy
//
//  Created by Rohan Konnur on 2/15/18.
//  Copyright © 2018 Rohan Konnur. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Firebase
import FirebaseDatabase

class instructorQRController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creating session
        let session = AVCaptureSession()
        
        //Define capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch
        {
            print ("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubview(toFront: returnButton)
        self.view.bringSubview(toFront: titleLabel)
        session.startRunning()
    }
    
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                    let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Upload", style: .default, handler: { (nil) in self.post(studentName: object.stringValue!)
                    }))
                    
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func post(studentName: String) {
        
        let message = studentName
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let result = formatter.string(from: date)
        let databaseName = " IEOR 171 Attendance Database"
        let finalDatabaseName = result + databaseName
        
        let post : [String : AnyObject] = ["name" : message as AnyObject]
        let databaseRef = Database.database().reference()
        
        databaseRef.child(finalDatabaseName).childByAutoId().setValue(post)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
