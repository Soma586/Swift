//
//  SetCard.swift
//  Homework 2
//
//  Created by lan on 10/5/18.
//  Copyright © 2018 CUNY Lehman College. All rights reserved.
//

import Foundation
import UIKit

class SetCard : Equatable {
    
    
    
    static func == (lhs: SetCard, rhs: SetCard) -> Bool {
        return (lhs.shape == rhs.shape) && (lhs.color == rhs.color) && (lhs.shade == rhs.shade) && (lhs.count == rhs.count)
    }
    
    
    var shape: Shapes
    var shade: Shades
    var color: Colors
    var count: Int
    
    var isSelected = false
    
    var isMatched = false
    var isMisMatched = false

    
    func contents() -> String {
        var shape: String
        
        switch (self.shape) {
        case .triangle:
            shape = "▲"
        case .circle:
            shape = "●"
        case .square:
            shape = "◼︎"
        }

        var s = ""

        for _ in 1...self.count {
            s += shape
        }
        
        return s
    }

    
    func attributedContents() -> NSAttributedString {
        
        var strokeColor: UIColor
        
        switch (self.color) {
        case .green:
            strokeColor = UIColor.green
        case .red:
            strokeColor = UIColor.red
        case .purple:
            strokeColor = UIColor.purple
        }
        
        var foregroundColor = strokeColor
        
        switch (self.shade) {
        case .outlined:
            foregroundColor = foregroundColor.withAlphaComponent(0.0)
        case .striped:
            foregroundColor = foregroundColor.withAlphaComponent(0.3)
        case .filled:
            foregroundColor = foregroundColor.withAlphaComponent(1.0)
        }
        
        
        let attributes: [NSAttributedStringKey: Any] = [
            .foregroundColor: foregroundColor,
            .strokeColor : strokeColor,
            .strokeWidth : -5.0
        ]
        
        let attributedString = NSAttributedString(string: self.contents(), attributes: attributes)

        return attributedString
    }
    
    
    
    enum Shapes {
        case triangle
        case circle
        case square
        
        static var all = [Shapes.triangle, .circle, .square]
    }
    
    enum Shades {
        case outlined
        case striped
        case filled
        
        static var all = [Shades.outlined, .striped, .filled]
    }
    
    enum Colors {
        case green
        case red
        case purple
        
        static var all = [Colors.green, .red, .purple]
    }
    
    init(shape: Shapes, shade: Shades, color: Colors, count: Int) {
        self.shape = shape
        self.shade = shade
        self.color = color
        self.count = count
        self.isSelected = false
    }
}
