//
//  ViewController.swift
//  boutTime
//
//  Created by Duc Vu on 9/9/17.
//  Copyright © 2017 Duc Vu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let rounds: [eventsController] = [
        eventsController(events: historicEvents),
        eventsController(events: historicEvents),
        eventsController(events: historicEvents),
        eventsController(events: historicEvents),
        eventsController(events: historicEvents),
        eventsController(events: historicEvents)
    ]
    var currentRound: Int = 0
    var score: Int = 0
    var countdownTimer: Timer!
    var totalTime = 0

    @IBOutlet weak var eventFirst: UILabel!
    @IBOutlet weak var eventSecond: UILabel!
    @IBOutlet weak var eventThird: UILabel!
    @IBOutlet weak var eventForth: UILabel!
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var correctAnswer: UIImageView!
    @IBOutlet weak var wrongAnswer: UIImageView!
    
    @IBOutlet weak var shakeToCompleteLabel: UILabel!
    
    @IBOutlet weak var fullDown: UIButton!
    @IBOutlet weak var halfUpFirst: UIButton!
    @IBOutlet weak var halfDownFirst: UIButton!
    @IBOutlet weak var halfUpSecond: UIButton!
    @IBOutlet weak var halfDownSecond: UIButton!
    @IBOutlet weak var fullUp: UIButton!
    
    @IBAction func swapEvents(_ sender: UIButton) {
        if (sender == fullDown || sender == halfUpFirst) {
            rounds[currentRound].eventSwapper(firstPosition: 0, secondPosition: 1)
            displayLabel(firstEvent: rounds[currentRound].eventDescription(at: 0), secondEvent: rounds[currentRound].eventDescription(at: 1))
        }
        
        if (sender == halfDownFirst || sender == halfUpSecond) {
            rounds[currentRound].eventSwapper(firstPosition: 1, secondPosition: 2)
            displayLabel(secondEvent: rounds[currentRound].eventDescription(at: 1), thirdEvent: rounds[currentRound].eventDescription(at: 2))
        }
        
        if (sender == halfDownSecond || sender == fullUp) {
            rounds[currentRound].eventSwapper(firstPosition: 2, secondPosition: 3)
            displayLabel(thirdEvent: rounds[currentRound].eventDescription(at: 2), forthEvent: rounds[currentRound].eventDescription(at: 3) )
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
        shakeToCompleteLabel.isHidden = true
        timer.isHidden = true
        if rounds[currentRound].isInAscendingOrder() {
            correctAnswer.isHidden = false
            score += 1
        } else {
            wrongAnswer.isHidden = false
        }
        currentRound += 1
        if currentRound < 6{
            loadNextRoundWithDelay(seconds: 2)
        } else {
            endGame()
        }
    }
    func endGame() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let endGameController = storyBoard.instantiateViewController(withIdentifier: "endGame")
        
        present(endGameController, animated: true, completion: nil)
        
    }
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.newRound(events: self.rounds[self.currentRound])
        }
    }
    
    func newRound(events: eventsController){
        
        
        shakeToCompleteLabel.isHidden = false
        correctAnswer.isHidden = true
        wrongAnswer.isHidden = true
        timer.isHidden = false
        
        displayLabel(firstEvent: events.eventDescription(at: 0), secondEvent: events.eventDescription(at: 1), thirdEvent: events.eventDescription(at: 2), forthEvent: events.eventDescription(at: 3) )
        totalTime = 60
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newRound(events: rounds[currentRound])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        totalTime = 0
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

