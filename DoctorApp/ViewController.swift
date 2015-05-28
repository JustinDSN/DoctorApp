//
//  ViewController.swift
//  DoctorApp
//
//  Created by jasonazghani on 5/27/15.
//  Copyright (c) 2015 DoctorApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!

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
    
    func viewTapped() {
        self.view.endEditing(true)
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("didFinishPickingImage")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.imageView.image = image
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("imagePickerControllerDidCancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

