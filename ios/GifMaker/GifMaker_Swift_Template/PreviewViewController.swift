//
//  PreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Zappts - Apple 1 on 04/05/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//
import UIKit

class PreviewViewController: UIViewController {
    
    var gif: Gif?
    
    @IBOutlet var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = gif?.gifImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
