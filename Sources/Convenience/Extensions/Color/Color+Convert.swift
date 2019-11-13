//
//  Color+Convert.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import UICocoa

public protocol Color {
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) { get }
    
}

public protocol HSBColorConvertable: Color {
    
    var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) { get }
    
}

extension HSBColorConvertable {
    
    public var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) {
        let value = self.rgba
        let minV = min(value.red, value.green, value.blue)
        let maxV = max(value.red, value.green, value.blue)
        let delta:CGFloat = maxV - minV
        var hue:CGFloat = 0
        if delta != 0 {
            switch maxV {
            case value.red:
                hue = (value.green - value.blue) / delta
            case value.green:
                hue = 2 - (value.blue - value.red) / delta
            default:
                hue = 4 + (value.red - value.green) / delta
            }
            hue *= 60
            if hue < 0 { hue += 360 }
        }
        let saturation = maxV == 0 ? 0 : (delta / maxV)
        let brightness = maxV
        return (hue / 360, saturation, brightness, value.alpha)
    }
    
}

public protocol HexColorConvertable: Color {
    
    init?(rgba value: UInt32)
    
}

extension HexColorConvertable {
    
    /// Creates a new UIColor instance from hex representation.
    public init?(hex: String) {
        guard Regex.color().match(hex).isSuccess else { return nil }
        var color = hex.replacingOccurrences(of: "#", with: "")
        if color.count == 6 { color += "FF" }
        var value: UInt32 = 0
        
        guard Scanner(string: color).scanHexInt32(&value) else { return nil }
        self.init(rgba: value)
    }
        
    public init?(rgb value: Int) {
        guard (0...0xffffff).contains(value) else { return nil }
        self.init(rgba: UInt32(value) << 24 + 0xff)
    }
        
    public init?(rgba value: UInt32) {
        guard (0...0xffffffff).contains(value) else { return nil }
        self.init(red   : CGFloat((value & 0xff000000) >> 24) / 255,
                  green : CGFloat((value & 0x00ff0000) >> 16) / 255,
                  blue  : CGFloat((value & 0x0000ff00) >> 8) / 255,
                  alpha : CGFloat(value & 0x000000ff) / 255)
    }
        
    public static func hex(_ value: String) -> Self? { Self.init(hex: value) }
        
    public static func hex(rgb value: Int) -> Self? { Self.init(rgb: value) }
        
    public static func hex(rgba value: Int) -> Self? { Self.init(rgba: UInt32(value)) }
    
}

extension UIColor: HexColorConvertable, HSBColorConvertable {
    
    public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
    
}
