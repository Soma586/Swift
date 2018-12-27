//
//  SetCard.swift
//  Set
//
//  Created by lan on 12/26/18.
//  Copyright © 2018 lan. All rights reserved.
//

import Foundation
import UIKit


struct SetCard{
    
    var shape : Shapes
    var color : Colors
    var shade: Shades
    var count: Int
    
    
    func contents() -> String{
        var contents = ""
        var shape : String
        
        switch (self.shape){
        case .square: shape = "◼︎"
        case .triangle: shape = "▲"
        case .circle: shape = "●"
        }
        
        for _ in 1...self.count{
            contents += shape
        }
        
        
        return contents
    }
    
    
    func attributedContents() -> NSAttributedString{
        var strokeColor: UIColor
        var foregroundColor: UIColor
        
        switch(self.color){
        case .red: strokeColor = UIColor.red
        case .green: strokeColor = UIColor.green
        case .purple: strokeColor = UIColor.purple
            
        }
        
        foregroundColor = strokeColor
        
        
        switch(self.shade){
        case .outlined: foregroundColor = foregroundColor.withAlphaComponent(0.0)
        case .filled: foregroundColor = foregroundColor.withAlphaComponent(1.0)
        case .striped: foregroundColor = foregroundColor.withAlphaComponent(0.3)//0.3
            
            //case .filled: foregroundColor.withAlphaComponent(1.0)
        }
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeColor: strokeColor,
            .foregroundColor: foregroundColor,
            .strokeWidth: -5.0
        ]
        
        let attributeString = NSAttributedString(string: self.contents(), attributes: attributes)
        
        return attributeString
    }
    
    
    enum Shapes{
        case square
        case triangle
        case circle
        
        static var all = [square, triangle, circle]
        
        //        var all:[Shapes]{
        //            get{
        //                return[.square,.triangle,.circle]
        //            }
        //        }
        //
    }
    
    enum Colors{
        case red
        case green
        case purple
        
        static var all = [red, green, purple]
        
    }
    enum Shades{
        case outlined
        case striped
        case filled
        
        static var all = [outlined,filled,striped]
        
    }
    
    
    init(shape: Shapes, color: Colors, shade: Shades, count: Int){
        self.shape = shape
        self.color = color
        self.shade = shade
        self.count = count
        
        
    }
    
}
