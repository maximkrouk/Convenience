//
//  UIColor+Convert.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import UIKit

extension UIColor {
    
    /// Creates a new UIColor instance from hex representation.
    public convenience init?(hex: String) {
        guard Regex.color().match(hex).isSuccess else { return nil }
        let color = hex.replacingOccurrences(of: "#", with: "")
        var number: UInt64 = 0
        
        guard Scanner(string: color).scanHexInt64(&number) else { return nil }
        
        self.init(red   : CGFloat((number & 0xff000000) >> 24) / 255,
                  green : CGFloat((number & 0x00ff0000) >> 16) / 255,
                  blue  : CGFloat((number & 0x0000ff00) >> 8) / 255,
                  alpha : CGFloat(number & 0x000000ff) / 255)
    }
    
}
