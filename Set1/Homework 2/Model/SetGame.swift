//
//  SetCardGame.swift
//  Homework 2
//
//  Created by lan on 10/5/18.
//  Copyright © 2018 CUNY Lehman College. All rights reserved.
//

import Foundation

class SetGame {
    
    var deck = SetCardDeck()
    
    var cards = [SetCard]()
    
    var score = 0
    
    private var selectedCards = [SetCard]()
    
    
    func selectCard(at index: Int) {
//        print("SetGame.selectCard(at: \(index)) - Was called")

        handleLeftOverMatchedCards()
        
        if (index <= cards.count) {
//            print("SetGame.selectCard(at: \(index)) - Index is valid")
            if (cards[index].isSelected) {
//                print("SetGame.selectCard(at: \(index)) - Card already selected")
                cards[index].isSelected = false
//                print("SetGame.selectCard(at: \(index)) - Card was already selected - Deselecting the card")
                if let removeIndex = selectedCards.index(of: cards[index]) {
                    selectedCards.remove(at: removeIndex)
                }
            } else {
//                print("SetGame.selectCard(at: \(index)) - Card was not already selected")
                cards[index].isSelected = true
                selectedCards.append(cards[index])
//                print("SetGame.selectCard(at: \(index)) - Size of selectedCards = \(selectedCards.count)")

                
                if (selectedCards.count == 3) {
                    if (aSetIsSelected()) {
                        score += 5
                        
/*                        for _ in 0..<3 {
                            if let card = deck.dealCard() {
                                self.cards.append(card)
                            }
                        }

                        for card in selectedCards {
                            if let index = cards.index(of: card) {
//                                print("SetGame.selectCard(at: \(index)) - Removing card at index = \(index)")
                                cards.remove(at: index)
                            }
                        }
*/
                    } else {
                        score -= 2
                    }

                    selectedCards.forEach({$0.isSelected = false})
                    selectedCards = [SetCard]()
                }
            }
        }
    }


    func peek() -> Bool {
        handleLeftOverMatchedCards()
        
        if checkForSetInCards() {
            score -= 5
            return true
        } else {
            cards.forEach({ $0.isMisMatched = true })
            score -= 2
            return false
        }
    }
    
    func addThreeCards() {
        handleLeftOverMatchedCards()
        
        if checkForSetInCards() {
            cards.forEach { $0.isSelected = false }
            score -= 2
        }
        for _ in 0..<3 {
            if let card = deck.dealCard() {
                self.cards.append(card)
            }
        }
    }

    
    func checkForSetInCards() -> Bool {
        deselectAllCards()
        
        for i in 0..<cards.count {
            selectedCards = [SetCard]()
            selectedCards.append(cards[i])
            for j in i+1..<cards.count {
                selectedCards.append(cards[j])
                for k in j+1..<cards.count {
                    selectedCards.append(cards[k])
                    if aSetIsSelected() {
                        //                        print("SetGame.checkForSetInCards() - Cards \(i), \(j), and \(k) form a set")
                        selectedCards.forEach({
                            $0.isSelected = true
                            $0.isMatched = false
                            $0.isMisMatched = false
                        })
                        selectedCards = [SetCard]()
                        return true
                    }
                    selectedCards[2].isMisMatched = false
                    selectedCards.remove(at: 2)
                    
                }
                selectedCards[1].isMisMatched = false
                selectedCards.remove(at: 1)
            }
            selectedCards[0].isMisMatched = false
            selectedCards.remove(at: 0)
        }
        
        return false
    }

    
    private func handleLeftOverMatchedCards() {
        let matchedCards = cards.filter({ $0.isMatched })
        matchedCards.forEach({
            if let index = cards.index(of: $0) {
                if let card = deck.dealCard() {
                    cards[index] = card
                } else {
                    cards.remove(at: index)
                }
            }
        })
        
        cards.forEach({ $0.isMatched = false })
        cards.forEach({ $0.isMisMatched = false })
    }

    
    private func aSetIsSelected() -> Bool {
        var thisIsASet = false
        
        var shapes = Set<SetCard.Shapes>()
        var colors = Set<SetCard.Colors>()
        var shades = Set<SetCard.Shades>()
        var counts = Set<Int>()
        
        selectedCards.forEach({shapes.insert($0.shape)})
        selectedCards.forEach({colors.insert($0.color)})
        selectedCards.forEach({shades.insert($0.shade)})
        selectedCards.forEach({counts.insert($0.count)})
        
        thisIsASet = ((shapes.count == 1 || shapes.count == 3) &&                      
                      (colors.count == 1 || colors.count == 3) &&
                      (shades.count == 1 || shades.count == 3) &&
                      (counts.count == 1 || counts.count == 3))

        selectedCards.forEach({ $0.isSelected = false })
        
        if thisIsASet {
            selectedCards.forEach({ $0.isMatched = true })
        } else {
            selectedCards.forEach({ $0.isMisMatched = true })
        }
        
//        print("SetGame.aSetIsSelected() - shapes=\(shapes.count) colors=\(colors.count) shades=\(shades.count) count=\(counts.count)")

//        if thisIsASet {
//            print("SetGame.aSetIsSelected() - We have a set!")
//        } else {
//            print("SetGame.aSetIsSelected() - No Set")
//        }
       
        return thisIsASet
    }
    
    
    private func deselectAllCards() {
        cards.forEach({
            $0.isSelected = false
        })
    }
    
    
    init() {
        self.deck = SetCardDeck()
        self.cards = [SetCard]()
        self.score = 0
        
        for _ in 0..<12 {
            if let card = deck.dealCard() {
                self.cards.append(card)
            }
        }
    }
    
}
