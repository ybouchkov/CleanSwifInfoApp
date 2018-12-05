//
//  UIImageView+.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 3.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Set circle image view
    /// - Parameters:
    /// - imageView: UIImageView
    func setRoundedImageView() {
        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.imageBorderColor.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
