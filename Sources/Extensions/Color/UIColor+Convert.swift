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
        var color = hex.replacingOccurrences(of: "#", with: "")
        if color.count == 6 { color += "FF" }
        var value: UInt32 = 0
        
        guard Scanner(string: color).scanHexInt32(&value) else { return nil }
        self.init(rgba: value)
    }
    
    public convenience init?(rgb value: Int) {
        guard (0...0xffffff).contains(value) else { return nil }
        self.init(rgba: UInt32(value) << 24 + 0xff)
    }
    
    public convenience init?(rgba value: UInt32) {
        guard (0...0xffffffff).contains(value) else { return nil }
        self.init(red   : CGFloat((value & 0xff000000) >> 24) / 255,
                  green : CGFloat((value & 0x00ff0000) >> 16) / 255,
                  blue  : CGFloat((value & 0x0000ff00) >> 8) / 255,
                  alpha : CGFloat(value & 0x000000ff) / 255)
    }
    
    public static func hex(_ value: String) -> UIColor? { UIColor(hex: value) }
    
    public static func hex(rgb value: Int) -> UIColor? { UIColor(rgb: value) }
    
    public static func hex(rgba value: UInt32) -> UIColor? { UIColor(rgba: value) }
    
}
