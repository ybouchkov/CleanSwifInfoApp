//
//  NavigationViewController.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit
import SideMenu

class NavigationViewController: UINavigationController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
    }
    
    // MARK: - Set up
    private func setupNavigation() {
        let menuScene = SlideViewController.instantiateFrom(appStoryboard: .menu)
        
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: menuScene)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        SideMenuManager.default.menuWidth = 0.7 * UIScreen.main.bounds.width
        // Prevent status bar area from turning black when menu appears:
        SideMenuManager.default.menuFadeStatusBar = false
        // Keep right part of the screen visible
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        /* If a view controller already in the stack is of the same class as the pushed view controller,
         the stack is instead popped back to the existing view controller.
        */
        SideMenuManager.defaultManager.menuPushStyle = .popWhenPossible
    }

}
