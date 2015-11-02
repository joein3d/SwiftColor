typealias Color = UInt32

import UIKit

extension Color {
    var UIColor: UIKit.UIColor {
        get {
            let r = UInt8((self & 0xFF000000) >> 24)
            let g = UInt8((self & 0x00FF0000) >> 16)
            let b = UInt8((self & 0x0000FF00) >> 8)
            let a = UInt8(self & 0x000000FF)
            let max:CGFloat = 255
            return UIKit.UIColor(red: CGFloat(r)/max, green: CGFloat(g)/max, blue: CGFloat(b)/max, alpha: CGFloat(a)/max)
        }
    }
    
    init(_ hexString: String) {
        let scanner = NSScanner(string: hexString)
        var rgba:UInt32 = 0
        if scanner.scanHexInt(&rgba) {
            self = rgba
        } else {
            self = 0xFFFFFFFF
        }
    }
    
}