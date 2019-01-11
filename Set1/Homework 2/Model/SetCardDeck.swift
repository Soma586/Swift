//
//  SetCardDeck.swift
//  Homework 2
//
//  Created by lan on 10/5/18.
//  Copyright © 2018 CUNY Lehman College. All rights reserved.
//

import Foundation

struct SetCardDeck {
    
    var deck = [SetCard]()
 
    
    mutating func dealCard() -> SetCard? {
        if deck.count > 0 {
            let card = deck.remove(at: 0)
            return card
        } else {
            return nil
        }
    }

    //didn't feel it was needed
    func count() -> Int {
        return deck.count
    }
    
    
    func isEmpty() -> Bool {
        if deck.count == 0 {
            return true
        }
        return false
    }
    
    init() {
        for color in SetCard.Colors.all {
            for shape in SetCard.Shapes.all {
                for shade in SetCard.Shades.all {
                    for count in 1...3 {
                        deck += [SetCard(shape: shape, shade: shade, color: color, count: count)]
                    }
                }
            }
        }
        
        for _ in 1...10 {
            for index in deck.indices {
                let randomIndex = Int(arc4random_uniform(UInt32(index)))
                let card = deck.remove(at: randomIndex)
                deck.append(card)
            }
        }
    }
}
