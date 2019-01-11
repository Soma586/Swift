//
//  ViewController.swift
//  Homework 2
//
//  Created by lan on 10/5/18.
//  Copyright © 2018 CUNY Lehman College. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    lazy var setGame = SetGame()
    
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            updateViewFromModel()
        }
    }
    
    @IBOutlet weak var plusThree: UIButton!
    
    @IBOutlet var setButtons: [UIButton]!
    
    
    @IBAction func selectSetCard(_ sender: UIButton) {
        if let cardNumber = setButtons.index(of: sender) {
//            print("SetViewController.selectSetCard index=\(cardNumber)")
            setGame.selectCard(at: cardNumber)
            updateViewFromModel()
//        } else {
//            print("Chosen card was not in setCards")
        }

    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        setGame = SetGame()
        updateViewFromModel()
    }
    
    
    @IBAction func peek(_ sender: UIButton) {
        if setGame.peek() {
//            print("SetViewController.peek() - There is a set in the cards")
            
            updateViewFromModel()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.setGame.cards.forEach { $0.isSelected = false }
                self.updateViewFromModel()
            })
        } else {
            updateViewFromModel()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.setGame.cards.forEach { $0.isMisMatched = false }
                self.updateViewFromModel()
            })
        }
    }
    
    @IBAction func addThreeCards(_ sender: UIButton) {
        setGame.addThreeCards()
        updateViewFromModel()
    }
    
    
    private func updateViewFromModel() {

        setButtons.forEach({
            $0.isHidden = true
            $0.isEnabled = false
        })
        
        for index in setGame.cards.indices {
            setButtons[index].isHidden = false
            setButtons[index].isEnabled = true
            setButtons[index].setAttributedTitle(setGame.cards[index].attributedContents(), for: UIControlState.normal)
            setButtons[index].layer.cornerRadius = 8.0
            if setGame.cards[index].isSelected {
                setButtons[index].layer.borderWidth = 5.0
                setButtons[index].layer.borderColor = UIColor.red.cgColor
//                setButtons[index].backgroundColor = UIColor.lightGray
            } else if setGame.cards[index].isMatched {
//                let lightGreen = UIColor.green.withAlphaComponent(0.4)
//                setButtons[index].backgroundColor = lightGreen
                setButtons[index].layer.borderWidth = 5.0
                setButtons[index].layer.borderColor = UIColor.green.cgColor
                setButtons[index].isEnabled = false
            } else if setGame.cards[index].isMisMatched {
//                let lightRed = UIColor.red.withAlphaComponent(0.4)
//                setButtons[index].backgroundColor = lightRed
                setButtons[index].layer.borderWidth = 5.0
                setButtons[index].layer.borderColor = UIColor.red.cgColor
            } else {
                setButtons[index].layer.borderWidth = 0.0
//                setButtons[index].backgroundColor = UIColor.white
            }
        }

        scoreLabel.text = "Score: \(setGame.score)"
        
        if (setGame.cards.count == 24) || (setGame.deck.isEmpty()) {
            plusThree.isEnabled = false
            plusThree.isHidden = true
        }
    }
    
    
}

