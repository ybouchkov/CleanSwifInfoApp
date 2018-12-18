//
//  UIStoryboard+.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

/// Enum of all storyboards in the app
enum Storyboard: String {
    
    case main
    case menu
    case home
    case snapkit
    case alamofire
    
    var fileName: String {
        return rawValue.capitalizingFirstLetter()
    }
    
    var instance: UIStoryboard {
        return UIStoryboard(name: fileName, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(from viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T 
    }
    
    func instantiatedViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
