//
//  UIFont+Montserrat.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 3.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

enum MontserratStyle: String {
    case bold
    case light
    case regular
    case thin
    
    func fontName() -> String {
        switch self {
        case .bold:
            return "Montserrat-Bold"
        case .light:
            return "Montserrat-Light"
        case .regular:
            return "Montserrat-Regular"
        case .thin:
            return "Montserrat-Thin"
        }
    }
    
    func fontFileName() -> String {
        return fontName()
    }
    
    func fontFamilyName() -> String {
        return "Montserrat"
    }
}

extension UIFont {
    
    class func montserrat(ofSize fontSize: CGFloat, style: MontserratStyle) -> UIFont? {
        loadMontserratFont(ofStyle: style)
        return UIFont(name: style.fontName(), size: fontSize)
    }
    
    private class func loadMontserratFont(ofStyle style: MontserratStyle) {
        if UIFont.fontNames(forFamilyName: style.fontFamilyName()).contains(style.fontName()) {
            return
        }
        
        FontLoader.loadFont(style.fontFileName())
    }
}

// MARK: - Helpers
class FontLoader {
    
    class func loadFont(_ name: String) {
        guard
            let fontURL = URL.fontURL(for: name),
            let data = try? Data(contentsOf: fontURL),
            let provider = CGDataProvider(data: data as CFData),
            let font = CGFont(provider)
            else { return }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            guard let nsError = error?.takeUnretainedValue() as AnyObject as? NSError else {
                return
            }
            NSException(name: NSExceptionName.internalInconsistencyException,
                        reason: errorDescription as String,
                        userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }

}

extension URL {
    
    static func fontURL(for fontName: String) -> URL? {
        let bundle = Bundle(for: FontLoader.self)
        
        if let fontURL = bundle.url(forResource: fontName, withExtension: "ttf") {
            return fontURL
        }
        
        return nil
    }
    
}
