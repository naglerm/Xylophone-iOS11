//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController{
    
    
    var player = AVAudioPlayer() 
    
    var noteResourceNames = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        playSound(noteResource: noteResourceNames[sender.tag - 1]) 
        
        // This is a way to do it using AVFoundation
//        // sender has a property called "tag" which is an attribute and can be set under "View" in attribute inspector, i.e. sender.tag
//        let url = Bundle.main.url(forResource: noteResourceName, withExtension: "wav")!
//
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else { return }
//            player.prepareToPlay()
//            player.play()
//        } catch let error as Error {
//            print(error.localizedDescription)
//        }
        // And here's a way using AudioToolBox
//        if let url = Bundle.main.url(forResource: noteResourceName, withExtension: "wav") {
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(url as CFURL, &mySound)
//            //play
//            AudioServicesPlaySystemSound(mySound)
//        }
        
        
        
    }
    
    func playSound(noteResource: String) {
        // And here's the way recommended by the lesson. Like way 1 bt a bit simpler (no guards, etc.)
        
        let url = Bundle.main.url(forResource: noteResource, withExtension: "wav")
        
        do {
            try player = AVAudioPlayer(contentsOf: url!)
        } catch {
            print(error)
        }
        player.play()
    }
    
  

}

