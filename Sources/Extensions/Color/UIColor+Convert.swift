//
//  UIColor+Convert.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import UIKit

extension UIColor {
    
    public convenience init?(hex: String) {
        guard "#{0,1}[0-9a-f]{6}".regex([.caseInsensitive]).matches(hex) else { return nil }
        let color = hex.hasPrefix("#") ? hex[1...].string : hex
        let scanner = Scanner(string: color)
        var number: UInt64 = 0
        
        guard scanner.scanHexInt64(&number) else { return nil }
        
        let r, g, b, a: CGFloat
        r = CGFloat((number & 0xff000000) >> 24) / 255
        g = CGFloat((number & 0x00ff0000) >> 16) / 255
        b = CGFloat((number & 0x0000ff00) >> 8) / 255
        a = CGFloat(number & 0x000000ff) / 255
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
}
