//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageLabel: UILabel!
    let eggTimes = ["Soft": 1, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var secondspassed = 0
    var totaltime = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
       
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totaltime = eggTimes[hardness]!
    
        
        progressView.progress=0.0
        secondspassed=0
        imageLabel.text=hardness
        
     
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
        
    }
    
    @objc func updateTimer(){
        if secondspassed <= totaltime {
            let progressPercentage = Float(secondspassed) /  Float(totaltime)
            progressView.progress=progressPercentage
            secondspassed+=1
            print(progressPercentage)
         
        }
        else{
            timer.invalidate()
            imageLabel.text = "DONE!"
            playSound()
            
            
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
//
}
