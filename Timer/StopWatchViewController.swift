//
//  StopWatchViewController.swift
//  Timer
//
//  Created by Nathan Jose on 1/9/20.
//  Copyright © 2020 Nathan Jose. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    //Buttons
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    //initialize GUI
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isEnabled = false
        stopButton.isEnabled = false
        startButton.isEnabled = true
        resetButton.layer.cornerRadius = 4.0
        resetButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = 4.0
        startButton.layer.masksToBounds = true
        stopButton.layer.cornerRadius = 4.0
        stopButton.layer.masksToBounds = true
        
    }
    //Function to be executed if Reset Button is pressed
    @IBAction func resetDidTap(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        startButton.isEnabled = true
        stopButton.isEnabled = false
        startButton.alpha=1.0
        resetButton.alpha=0.5
        stopButton.alpha=0.5
    }
    //Function to be executed if Start Button is pressed
    @IBAction func startDidTap(_ sender: Any) {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            resetButton.isEnabled = true
            stopButton.isEnabled = true
            startButton.isEnabled = false
            startButton.alpha=0.5
            resetButton.alpha=1.0
            stopButton.alpha=1.0
             
            
        }
    }
    //Function to be executed if Stop Button is pressed
    @IBAction func stopDidTap(_ sender: Any) {
        print("stopDidTap")
        resetButton.isEnabled = true
        stopButton.isEnabled = false
        startButton.isEnabled = true
        
        isTimerRunning = false
        timer.invalidate()
        startButton.alpha=1.0
        resetButton.alpha=1.0
        stopButton.alpha=0.5
        
        
    }
    //Function to compute time calculations to be displayed
    @objc func runTimer() {
        counter+=0.1
        timerLabel.text = "\(counter)"
        //HH:MM:SS:_
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        let decisecond = String(format: "%.1f", counter).components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour):\(minuteString):\(secondString):\(decisecond)"

        
    }
}
