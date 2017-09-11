//
//  ViewController.swift
//  boutTime
//
//  Created by Duc Vu on 9/9/17.
//  Copyright © 2017 Duc Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eventFirst: UILabel!
    @IBOutlet weak var eventSecond: UILabel!
    @IBOutlet weak var eventThird: UILabel!
    @IBOutlet weak var eventForth: UILabel!
    
    var events: [Event] = []

    @IBAction func swapFirstAndSecond() {
        let tempEvent: Event = events[1]
        events[1] = events[0]
        events[0] = tempEvent
        
        eventFirst.text = events[0].description
        eventSecond.text = events[1].description
        
        endRoundWithDelay(seconds: 35)
    }
   
    @IBAction func swapSecondAndThird() {
        let tempEvent: Event = events[2]
        events[2] = events[1]
        events[1] = tempEvent
        
        eventSecond.text = events[1].description
        eventThird.text = events[2].description
        
        endRoundWithDelay(seconds: 35)
    }
    
    @IBAction func swapThirdAndForth() {
        let tempEvent: Event = events[3]
        events[3] = events[2]
        events[1] = tempEvent
        
        eventThird.text = events[2].description
        eventForth.text = events[3].description
        
        endRoundWithDelay(seconds: 35)
    }
    
    func endRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
//            self.nextRound()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        events = GameController.newRound(events: historicEvents)
        eventFirst.text = events[0].description
        eventSecond.text = events[1].description
        eventThird.text = events[2].description
        eventForth.text = events[3].description
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

