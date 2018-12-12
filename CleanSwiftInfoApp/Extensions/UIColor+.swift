//
//  UIColor+.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 30.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

/// Define all colours for the application
/// Please, provide same name as in Assets
enum AppColors: String {
    
    case primaryColor
    case backgroundItemsColor
    case redItemsColor
    case imageBorderColor
    case textGrayColor
    
    var colorName: String {
        return rawValue
    }
}


extension UIColor {
    
    // MARK: - UIColors + Brand
    
    /// PrimaryColor
    public class var primaryColor: UIColor {
        return UIColor(named: AppColors.primaryColor.colorName) ?? .white
    }
    
    /// BackgroundColor
    class var backgroundColor: UIColor {
        return UIColor(named: AppColors.backgroundItemsColor.colorName) ?? .white
    }
    
    /// App red Color
    class var redColor: UIColor {
        return UIColor(named: AppColors.redItemsColor.colorName) ?? .white
    }
    
    /// Border color of the image in menu
    class var imageBorderColor: UIColor {
        return UIColor(named: AppColors.imageBorderColor.colorName) ?? .white
    }
    
    class var textGrayColor: UIColor {
        return UIColor(named: AppColors.textGrayColor.colorName) ?? .white
    }
    
}


