//
//  ViewController.swift
//  DownloadFile
//
//  Created by paulo on 19/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pdfURL:URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func downloadAction(_ sender: UIButton) {
        guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else { return }
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
    
    @IBAction func openFile(_ sender: UIButton) {
        let pdfView = PDFViewController()
        pdfView.pdfURL = pdfURL
        present(pdfView, animated: true, completion: nil)
    }
}

extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("File Downloaded Location- ", location)
        
        guard let url = downloadTask.originalRequest?.url else {
            return
        }
        let docsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationPath = docsPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationPath)
        
        do {
            try FileManager.default.copyItem(at: location, to: destinationPath)
            self.pdfURL = destinationPath
            
        } catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
    
    
}
