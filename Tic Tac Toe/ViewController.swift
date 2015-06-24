//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Aaron Marquez on 6/23/15.
//  Copyright (c) 2015 Aaron Marquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = naughts, 2 = crosses
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningState = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainButton(sender: AnyObject) {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button : UIButton!
        
        for var i = 0; i < 9; i++ {
        
        button = view.viewWithTag(i) as! UIButton
        
        button.setImage(nil, forState: .Normal)
            
        }
        
        winLabel.hidden = true
        playAgain.hidden = true
        
        winLabel.center = CGPointMake(winLabel.center.x - 400, winLabel.center.y)
        
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)

        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        // The sender from above if the action that is being tapped on. i.e. the button. So after mapping all the other buttons to this function then changing sender.setImage will change the image being tapped on to a cross!
        
        if gameState[sender.tag] == 0 && gameActive == true {
        
            var image = UIImage()
        
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
            
                image = UIImage(named: "nought.png")!
            
                activePlayer = 2
            
            } else {
        
                image = UIImage(named: "cross.png")!
        
                activePlayer = 1
            }
        
            sender.setImage(image, forState: .Normal)
            
            for combination in winningState {
            
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = "Crosses Win!!"
                    
                    if gameState[combination[0]] == 1 {
                        
                        labelText = "Noughts Win!!"
                        
                    }
                    
                    winLabel.text = labelText
                    
                    winLabel.hidden = false
                    playAgain.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.winLabel.center = CGPointMake(self.winLabel.center.x + 400, self.winLabel.center.y)
                        
                        self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                        
                    })
                    
                    gameActive = false
                    
                }
            
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winLabel.hidden = true
        playAgain.hidden = true
        
        winLabel.center = CGPointMake(winLabel.center.x - 400, winLabel.center.y)
        
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        
        
    }


}

