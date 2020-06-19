//
//  ViewController.swift
//  Hyperlinks
//
//  Created by paulo on 19/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTextView()
    }

    func updateTextView() {
        let path = "https://google.com"
        let text = textView.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "here")
        let font = textView.font
        let textColor = textView.textColor
        textView.attributedText = attributedString
        textView.font = font
        textView.textColor = textColor
        
    }

}

