//
//  Theme.swift
//  Concentration
//
//  Created by lan on 9/16/18.
//  Copyright © 2018 lan. All rights reserved.
//

import Foundation

enum Theme: Int{
    
 
    case faceTheme,
        animalTheme,
        halloween,
        flags,
        sports,
        numbers
    
    
    //gives the cases a rawValue of Int so the Concentration class can call the theme class with a Integer
    //to pick one of the themes
    private static let _counter: Int = {
        var num = 0
        while let _ = Theme(rawValue: num){
            num += 1
        }
        return num
    }()
    

    func ichooseEmoji() -> Array<String>{
        switch self {
        case .faceTheme:
            return ["😍","😇","😎","🤥","😭","😑","😷","🙄"]
        case .flags:
            return ["🏁","🇧🇩","🇪🇺","🇯🇲","🇺🇸","🇪🇸","🇰🇷","🇯🇵"]
        case .animalTheme:
            return ["🦊","🦁","🐵","🐥","🐝","🐼","🐰","🐯"]
        case .halloween:
             return ["👻", "🎃", "😈", "☠️", "🧟‍♂️", "🍬", "🍭", "🍫"]
        case .numbers:
            return ["0️⃣","1️⃣","2️⃣","3️⃣","4️⃣","5️⃣","6️⃣","7️⃣"]
        case .sports:
            return ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🎱"]        }
    }
    
    
//    func getCaseCounts()-> Int{
//        
//        return Theme.sports.rawValue
//        
//        
//    }
    
}
