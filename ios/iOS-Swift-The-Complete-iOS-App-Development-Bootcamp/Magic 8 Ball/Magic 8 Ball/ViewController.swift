//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Paulo Keller on 16/05/20.
//  Copyright © 2020 Paulo Keller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ballArray = ["ball1","ball2","ball3","ball4","ball5"]

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
       newBallImage()
    }
    
    func newBallImage() {
        let randomBallIndex = Int.random(in: 0 ... 4)
        
        imageView.image = UIImage(named: ballArray[randomBallIndex])
    }
    
}

