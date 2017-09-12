//
//  ViewController.swift
//  boutTime
//
//  Created by Duc Vu on 9/9/17.
//  Copyright © 2017 Duc Vu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var events: eventsController = eventsController(events: historicEvents)
    var countdownTimer: Timer!
    var totalTime = 35

    @IBOutlet weak var eventFirst: UILabel!
    @IBOutlet weak var eventSecond: UILabel!
    @IBOutlet weak var eventThird: UILabel!
    @IBOutlet weak var eventForth: UILabel!
    @IBOutlet weak var timer: UILabel!
    
    
    @IBOutlet weak var fullDown: UIButton!
    @IBOutlet weak var halfUpFirst: UIButton!
    @IBOutlet weak var halfDownFirst: UIButton!
    @IBOutlet weak var halfUpSecond: UIButton!
    @IBOutlet weak var halfDownSecond: UIButton!
    @IBOutlet weak var fullUp: UIButton!
    
    @IBAction func swapEvents(_ sender: UIButton) {
        if (sender == fullDown || sender == halfUpFirst) {
            events.eventSwapper(firstPosition: 0, secondPosition: 1)
            displayLabel(firstEvent: events.eventDescription(at: 0), secondEvent: events.eventDescription(at: 1) )
        }
        
        if (sender == halfDownFirst || sender == halfUpSecond) {
            events.eventSwapper(firstPosition: 1, secondPosition: 2)
            displayLabel(secondEvent: events.eventDescription(at: 1), thirdEvent: events.eventDescription(at: 2) )
        }
        
        if (sender == halfDownSecond || sender == fullUp) {
            events.eventSwapper(firstPosition: 2, secondPosition: 3)
            displayLabel(thirdEvent: events.eventDescription(at: 2), forthEvent: events.eventDescription(at: 3) )
        }
    }
    

    func displayLabel(firstEvent: String? = nil, secondEvent: String? = nil, thirdEvent: String? = nil, forthEvent: String? = nil ){
        if let eventFirst = firstEvent {
            self.eventFirst.text = eventFirst
        }
        if let eventSecond = secondEvent {
            self.eventSecond.text = eventSecond
        }
        if let eventThird = thirdEvent {
            self.eventThird.text = eventThird
        }
        if let eventForth = forthEvent {
            self.eventForth.text = eventForth
        }
        
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        checkAnswer()
    }
    
    func updateTime() {
        timer.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            self.endTimer()
        }
    }
    
    func checkAnswer() {
        timer.text = "\(events.isOrdered())"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayLabel(firstEvent: events.eventDescription(at: 0), secondEvent: events.eventDescription(at: 1), thirdEvent: events.eventDescription(at: 2), forthEvent: events.eventDescription(at: 3) )
        
        startTimer()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

