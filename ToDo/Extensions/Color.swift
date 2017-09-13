//
//  Color.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var wetAsphalt: UIColor {
        return UIColor(hex: "34495e")
    }
    
    static var peterRiver: UIColor {
        return UIColor(hex: "3498db")
    }
    
    static var alizarin: UIColor {
        return UIColor(hex: "e74c3c")
    }
    
    static var greenSea: UIColor {
        return UIColor(hex: "16a085")
    }
    
    static var pink: UIColor {
        return UIColor(hex: "#E91E63")
    }
    
    static var lightBlue: UIColor {
        return UIColor(hex: "#03A9F4")
    }
    
    static var lime: UIColor {
        return UIColor(hex: "#CDDC39")
    }
    
    static var indigo: UIColor {
        return UIColor(hex: "#3F51B5")
    }
    
    static var westiria: UIColor {
        return UIColor(hex: "8e44ad")
    }
    
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hex.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
