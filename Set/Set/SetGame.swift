//
//  SetGame.swift
//  Set
//
//  Created by lan on 12/26/18.
//  Copyright © 2018 lan. All rights reserved.
//

import Foundation

class SetGame{
    
    var deck = SetDeck()
    var cards = [SetCard]()
    var score = 0
    
    
    
    func chooseCard(at Index: Int){
        
        
    }
    
    func isMatched(){
        
    }
    
    func addScore(){
        score += 1
        
    }
    
    
    func addthreeCards(){
        if(!deck.isEmpty()){
            for _ in 0..<3{
               cards.append(deck.dealCard()!)
                
            }
        }
    
    }
    
    
    
    
    
    func showMe(){
        print(deck.dealCard()?.color as Any)
    }
    
    init(){
        showMe()
        print("before", cards.count)
        for _ in 0..<12{
            cards.append(deck.dealCard()!)
        }
         print("after", cards.count)
        
    }

}
