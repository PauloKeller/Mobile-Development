//
//  ViewController.swift
//  OpenPDF
//
//  Created by paulo on 19/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    let pdfTitle = "pdf"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openPDFAction(_ sender: UIButton) {
        
        if let url = Bundle.main.url(forResource: pdfTitle, withExtension: "pdf") {
            let webView = WKWebView(frame: self.view.frame)
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
            
            let pdfViewController = UIViewController()
            pdfViewController.view.addSubview(webView)
            pdfViewController.title = pdfTitle
            self.navigationController?.pushViewController(pdfViewController, animated: true)
        }
    }
    
}

