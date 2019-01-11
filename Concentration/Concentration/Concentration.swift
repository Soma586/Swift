//
//  Concentration.swift
//  Concentration
//
//  Created by Sameh on 9/5/18.
//  Copyright © 2018 lan. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var shuffledcards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    var score = 0
    var flipCount = 0
    
    func chooseCard(at index: Int) {
        //triggers the amount of flipcount to go up
        flipCount += 1
        if !shuffledcards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if shuffledcards[matchIndex].identifier == shuffledcards[index].identifier {
                    shuffledcards[matchIndex].isMatched = true
                    shuffledcards[index].isMatched = true
                    //once the two careds are matched the score goes up by two
                    score += 2
                    
                }
                //if card has not been matched and if one of the two selected cards has been already selected before
                //decrease the score by one
                if !shuffledcards[index].isMatched && (shuffledcards[matchIndex].hasBeenSeen || shuffledcards[index].hasBeenSeen){
                    score += -1
                }
                //next two lines represent the cards that were faceup and
                //labels them that the cards at these indexes has been seen before
                shuffledcards[matchIndex].hasBeenSeen = true
                shuffledcards[index].hasBeenSeen = true
                shuffledcards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either 0 or 2 cards are face up
                for flipDownIndex in shuffledcards.indices {
                    shuffledcards[flipDownIndex].isFaceUp = false
                }
                shuffledcards[index].isFaceUp = true
              
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        print("score ", score)
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        //shuffles the deck from "cards" to the new array "shuffledcards"
        for _ in 0..<cards.count{
            let ran = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledcards.append(cards[ran])
            cards.remove(at: ran)
        }
        
        
    }
}
