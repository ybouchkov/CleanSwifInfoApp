//
//  UIViewController+.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit
import SideMenu

extension UIViewController {
    
    /// ViewController's StoryboardID title
    static var storyboardID: String {
        return "\(self)"
    }
    
    /// Instantiate View Controller
    /// -   Usage:
    /// -   let vcScene = (VC)Scene.instantiate(fromAppStoryboard: .Storyboard)
    static func instantiateFrom(appStoryboard: Storyboard) -> Self {
        return appStoryboard.viewController(from: self)
    }
}

// MARK: - UIViewController+MethodSwizzling
extension UIViewController {
    
    /// Custom hamburger menu btn
    var menuBarButtoItem: UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "menu-button"), for: .normal)
        button.addTarget(self,
                         action: #selector(hamburgerBtnPressed),
                         for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    /// Navigation LogoView
    var navigationTitleView: UIView {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Ad-Astra-Ventures-Startup-Accelerator-Program-San-Diego_Logo-03-1"))
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width / 2, height: 30.0)
        imageView.contentMode = .scaleAspectFill
        let frame = CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0)
        let titleView = UIView(frame: frame)
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        return titleView
    }
    
    // MARK: - Actions
    @objc
    fileprivate func hamburgerBtnPressed() {
        guard let menuLeftNavigationController = SideMenuManager.default.menuLeftNavigationController else { return }
        present(menuLeftNavigationController,
                animated: true,
                completion: nil)
    }
}

