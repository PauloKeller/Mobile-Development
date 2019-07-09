//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Zappts - Apple 1 on 06/03/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import Foundation
import MobileCoreServices

let frameCount = 16
let delayTime: Float = 0.2
let loopCount = 0

extension UIViewController {

    @IBAction func launchVideoCamera(sender: AnyObject) {
        // create imagePicker
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = UIImagePickerControllerSourceType.camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
        
    }
    
}

extension UIViewController: UINavigationControllerDelegate{}

extension UIViewController: UIImagePickerControllerDelegate {
    
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String {
            let videoURL = info[UIImagePickerControllerMediaURL] as! NSURL
            dismiss(animated: true, completion: nil)
            convertVideoToGif(videoURL: videoURL)
//            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path!, nil, nil, nil)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // GIF conversion methods
    func convertVideoToGif(videoURL: NSURL) {
        let regift = Regift(sourceFileURL: videoURL as URL, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        let gifURL = regift.createGif()
        let gif = Gif(url: gifURL! as NSURL, videoURL: videoURL, caption: nil)
        displayGIF(gif: gif)
    }
    
    func displayGIF(gif: Gif) {
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gif = gif
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
 
}
