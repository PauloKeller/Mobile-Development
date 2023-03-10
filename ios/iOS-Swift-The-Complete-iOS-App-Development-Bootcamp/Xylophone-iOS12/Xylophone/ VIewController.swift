//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    var audioPlayer = AVAudioPlayer()
    let sounds = ["note1","note2","note3","note4","note5","note6","note7",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        let selectedSoundFileName = sounds[sender.tag - 1]
        
        playSound(soundFileName: selectedSoundFileName)
    }
    
    func playSound(soundFileName:String) {
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error.localizedDescription)
        }
        
        audioPlayer.play()
    }
}

