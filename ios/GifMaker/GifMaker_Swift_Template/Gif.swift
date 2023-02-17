//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Zappts - Apple 1 on 04/05/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class Gif {
    var url: NSURL?
    var videoURL: NSURL?
    var caption: String?
    var gifImage: UIImage?
    var gifData: NSData?
    
    init(url:NSURL, videoURL: NSURL, caption: String?) {
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gif(url: url.absoluteString!)
        self.gifData = nil
    }
    
    init(name: String){
        self.gifImage = UIImage.gif(name: name)
        self.url = nil
        self.videoURL = nil
        self.caption = nil
        self.gifData = nil
    }
}
