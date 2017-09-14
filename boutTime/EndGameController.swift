//
//  EndGameController.swift
//  boutTime
//
//  Created by Duc Vu on 9/13/17.
//  Copyright © 2017 Duc Vu. All rights reserved.
//

import UIKit

class EndGameController: UIViewController {

    @IBOutlet weak var scoreBoard: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scoreBoard.text = "\(ScoreTracker.score)/6"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGame() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newGameController = storyBoard.instantiateViewController(withIdentifier: "main")
        
        present(newGameController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
