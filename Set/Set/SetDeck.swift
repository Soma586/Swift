//
//  SetDeck.swift
//  Set
//
//  Created by lan on 12/26/18.
//  Copyright © 2018 lan. All rights reserved.
//

import Foundation

struct SetDeck{
    
    
    var deck = [SetCard]()
    
    
    mutating func dealCard() -> SetCard?{
        if (deck.count > 0){
            let card = deck.remove(at: 0)
            return card
        }
        return nil
    
        
    }
    
    func isEmpty() -> Bool{
        return deck.count == 0
        
    }
    
    
    init(){
        for color in SetCard.Colors.all {
            for shape in SetCard.Shapes.all {
                for shade in SetCard.Shades.all {
                    for count in 1...3 {
                        deck += [SetCard(shape: shape, color: color, shade: shade, count: count)]
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
