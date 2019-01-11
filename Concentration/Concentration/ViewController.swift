//
//  ViewController.swift
//  Concentration
//
//  Created by Sameh on 8/27/18.
//  Copyright © 2018 lan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
   
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
   
    @IBOutlet weak var score: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
//    var flipCount = 0 {
//        didSet {
//            flipCountLabel.text = "Flips: \(flipCount)"
//        }
//    }

    @IBAction func touchCard(_ sender: UIButton) {
        //flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            //print("cardNumber: ", cardNumber)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            //print("num of emojis:", emojiChoices.count)
        } else {
            print("chosen card was not in the collection")
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        let ran  = Int(arc4random_uniform(6))
        print("num", ran)
        
        //selects from one of the 6 themes randomly
       let theme = Theme(rawValue: ran)
    
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        flipCountLabel.text = "Flips: \(game.flipCount)"
       // flipCountLabel.text = String(game.flipCount)
        updateViewFromModel()
       
        emojiChoices = (theme?.ichooseEmoji())!
        
    }
    
    
    
    
    var emoji = [Int: String]()
    
    var emojiChoices = ["👻", "🎃", "😈", "☠️", "🧟‍♂️", "🍎", "🍬", "🍭", "🍫"]
  
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? ":D"
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.shuffledcards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        score.text = String(game.score)
        flipCountLabel.text = "Flips: \(game.flipCount)"
    }
    
}

