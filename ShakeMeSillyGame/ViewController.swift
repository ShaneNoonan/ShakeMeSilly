//
//  ViewController.swift
//  ShakeMeSillyGame
//
//  Created by Shane Noonan on 12/02/2017.
//  Copyright © 2017 Shane Noonan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var startButton: UIButton!
    
    var timer = Timer()
    
    var countInt = 0
    var scoreInt = 0
    var modeInt = 0
    var imageInt = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countInt = 10
        scoreInt = 0
        
        timerLabel.text = String(countInt)
        scoreLabel.text = String(scoreInt)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        
        if countInt == 10 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
            
            startButton.isEnabled = false
            startButton.alpha = 0.5
            
            modeInt = 1
            
        }
        
        if countInt == 0 {
            
            countInt = 10
            scoreInt = 0
            
            timerLabel.text = String(countInt)
            scoreLabel.text = String(scoreInt)
            
            startButton.setTitle("Start Game", for: [])
            
        }
        
    }
    
    func countDown() {
        
        countInt -= 1
        timerLabel.text = String(countInt)
        
        if countInt == 0 {
            
            //stops timer
            timer.invalidate()
            
            startButton.isEnabled = true
            startButton.alpha = 1.0
            
            startButton.setTitle("Restart Game", for: [])
            
            //stops the scoring
            modeInt = 0
        }
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            if modeInt == 1 {
                
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                
                imageInt += 1
                
                if imageInt == 5 {
                    imageInt = 1
                }
                
                imageView.image = UIImage(named: "Maracas\(imageInt)")
                
            }
        }
    }

}

