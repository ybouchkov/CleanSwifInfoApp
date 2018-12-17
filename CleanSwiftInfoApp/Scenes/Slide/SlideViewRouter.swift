//
//  SlideViewRouter.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

protocol SlideViewRoutingLogic {
    
    func navigateTo(selectedMenuItem item: SlideMenuItem)
}

class SlideViewRouter: SlideViewRoutingLogic {
    
    weak var viewController: SlideViewController?
    
    // MARK: - SlideViewRoutingLogic
    func navigateTo(selectedMenuItem item: SlideMenuItem) {
        switch item.action {
        case .snapKitTutorial:
            let snapKitScene = SnapKitViewController.instantiateFrom(appStoryboard: .snapkit)
            viewController?.show(snapKitScene, sender: nil)
        case .home:
            let homeScene = HomeViewController.instantiateFrom(appStoryboard: .home)
            viewController?.show(homeScene, sender: nil)
        default:
            break
        }
    }
    
}
