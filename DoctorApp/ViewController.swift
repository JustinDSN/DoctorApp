//
//  ViewController.swift
//  DoctorApp
//
//  Created by jasonazghani on 5/27/15.
//  Copyright (c) 2015 DoctorApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var currentCase = Case()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "viewTapped")
        self.view.addGestureRecognizer(tapGestureRecognizer);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePicture(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self;
        
        self.presentViewController(imagePicker, animated: true, completion: nil);
    }
    
    @IBAction func sendCase(sender: AnyObject) {
        println("sendCase")
        self.currentCase.description = self.descriptionTextView.text
    }
    
    func viewTapped() {
        self.view.endEditing(true)
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("didFinishPickingImage")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.currentCase.image = image
        self.imageView.image = image
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("imagePickerControllerDidCancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

