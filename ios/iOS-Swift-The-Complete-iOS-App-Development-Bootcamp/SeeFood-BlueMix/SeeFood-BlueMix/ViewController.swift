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
    var classificationResults = [String]()
    
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
                let classes = classifiedImages!.result!.images.first!.classifiers.first!.classes
                
                self.classificationResults = []
                
                for index in 0..<classes.count {
                    self.classificationResults.append(classes[index].class)
                }
                
                print(self.classificationResults)
                
                if self.classificationResults.contains("hotdog") {
                    DispatchQueue.main.async {
                        self.navigationItem.title = "Hotdog!"
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.navigationItem.title = "Not hotdog!"
                    }
                    
                }
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

