//
//  ViewController.swift
//  SeeFood-BlueMix
//
//  Created by paulo on 12/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit
import VisualRecognition

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let apiKey = "M2Z0Bw5Zr1MA_HrbMNERlh4UVg1k9-AHNXlRFuYHoz5N"
    let version = "2020-06-12"
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            
            imagePicker.dismiss(animated: true, completion: nil)
            
            let authenticator = WatsonIAMAuthenticator(apiKey: apiKey)
            let visualRecognition = VisualRecognition(version: version, authenticator: authenticator)
            
            visualRecognition.classify(image: image) { (classifiedImages, error) in
                print(classifiedImages)
                print(error)
            }
            
            
            
        } else {
            print("There was an error picking the image")
        }
    }


    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}

