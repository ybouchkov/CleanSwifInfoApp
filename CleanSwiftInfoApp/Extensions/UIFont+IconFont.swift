//
//  UIFont+IconFont.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 4.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit


enum MWGIconFont: UInt32 {
    
    case home = 0xe900
    case profile = 0xe907
    // TODO: Other Icons
    
    public func attributedString(size: CGFloat = CGFloat(12),
                                 color: UIColor? = nil) -> NSAttributedString? {
        guard let font = UIFont.iconFont(ofSize: size), let string = String.string(forIcon: self) else {
            return nil
        }
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[NSAttributedString.Key.font] = font
        
        if let color = color {
            attributes[NSAttributedString.Key.foregroundColor] = color
        }
        
        return NSAttributedString(string: string, attributes: attributes)
    }
    
}

extension UIFont {
    
    class func iconFont(ofSize fontSize: CGFloat) -> UIFont? {
        loadIconFont()
        let font = UIFont(name: "icomoon", size: fontSize)
        return font
    }
    
    private class func loadIconFont() {
        if UIFont.fontNames(forFamilyName: "icomoon").contains("icomoon") {
            return
        }
        
        FontLoader.loadFont("MWG-Iconfont")
    }
    
}

extension String {
    
    static func string(forIcon icon: MWGIconFont) -> String? {
        var rawIcon = icon.rawValue
        let xPtr = withUnsafeMutablePointer(to: &rawIcon, { $0 })
        return String(bytesNoCopy: xPtr,
                      length: MemoryLayout<UInt32>.size,
                      encoding: String.Encoding.utf32LittleEndian,
                      freeWhenDone: false)
    }
    
}

extension UIImage {
    
    static func image(from icon: MWGIconFont,
                      color: UIColor,
                      size: CGFloat,
                      to imageSize: CGSize) -> UIImage {
        guard let attributedString = icon.attributedString(size: size, color: color) else {
            return UIImage()
        }
        
        let rect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        let range = NSRange(location: 0, length: attributedString.length)
        let mutableCopy = NSMutableAttributedString(attributedString: attributedString)
        mutableCopy.addAttribute(NSAttributedString.Key.paragraphStyle,
                                 value: paragraphStyle,
                                 range: range)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        mutableCopy.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
}
