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

    @IBAction func swapFirstAndSecond() {
        let temp: String = eventSecond.text!
        eventSecond.text = eventFirst.text
        eventFirst.text = temp
    }
   
    @IBAction func swapSecondAndThird() {
        let temp: String = eventThird.text!
        eventThird.text = eventSecond.text
        eventSecond.text = temp
    }
    
    @IBAction func swapThirdAndForth() {
        let temp: String = eventForth.text!
        eventForth.text = eventThird.text
        eventThird.text = temp
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

