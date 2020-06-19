//
//  PDFViewController.swift
//  DownloadFile
//
//  Created by paulo on 19/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    var pdfView = PDFView()
    var pdfURL:URL!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pdfView)
        
        if let document = PDFDocument(url: pdfURL) {
            pdfView.document = document
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    override func viewDidLayoutSubviews() {
        pdfView.frame = self.view.frame
    }

}
