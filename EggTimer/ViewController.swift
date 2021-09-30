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
    
    let eggTimes = ["Soft": 5, "Medium":12, "Hard":20]
    var counter: Int = 0
    var timer = Timer()
    var total_time: Int = 0
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        progressBar.progress = 0
        titleLabel.text = hardness
        counter = eggTimes[hardness]!
        total_time = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update_timer), userInfo: nil, repeats: true)

    }
    @IBOutlet weak var titleLabel: UILabel!
    @objc func update_timer() {
        if counter > 0 {
            counter-=1
            progressBar.progress = Float(((Float(counter)/Float(total_time))-1)*(-1))
            
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
            
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
}
