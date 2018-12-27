//
//  ViewController.swift
//  Set
//
//  Created by lan on 12/26/18.
//  Copyright © 2018 lan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = SetGame()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var plusthreeButtons: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!{
        didSet{
            updateViewFromModel()
        }
    }
    
    
    @IBAction func addThreeButton(_ sender: UIButton) {
        
        
        
        game.addthreeCards()
        updateViewFromModel()
       
    }
    
    
    
   
    @IBAction func restartButton(_ sender: UIButton) {
        game = SetGame()
        updateViewFromModel()
        plusthreeButtons.isEnabled = true
    }
    
    
    @IBAction func selectCard(_ sender: UIButton) {
        game.addScore()
        updateViewFromModel()
        
        
    }
    
    
    func updateViewFromModel(){
        cardButtons.forEach({
            $0.isHidden = true
            })
        
        for index in game.cards.indices{
            cardButtons[index].isHidden = false
            
            
        }
        
        
        scoreLabel.text = "score: \(game.score)"
        
        
        if(game.cards.count == 24 || game.deck.isEmpty()){
            plusthreeButtons.isEnabled = false
        }
    
    
    
 
 
    }

}

