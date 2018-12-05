//
//  SlideViewPresenter.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol SlideViewPresentationLogic {
    // func presentMenuItems(response: Response)
    func presentMenuItems(response: SlideMenuItemResponse)
    
}

class SlideViewPresenter: SlideViewPresentationLogic {
    
    // MARK: - Properties
    weak var viewController: SlideViewController?
    
    // MARK: - SlideViewPresentationLogic
    func presentMenuItems(response: SlideMenuItemResponse) {
        let menuViewModels: [SlideMenuItemViewModel] = response.actions.map { action in
            var menuItem: SlideMenuItemViewModel
            
            switch action {
            case .account:
                menuItem = SlideMenuItemViewModel(for: .account, at: 0)
                setupAccountMenuItemViewModel(menuItem, "Account")
            }
            
            return menuItem
        }
        
        viewController?.displayMenuItems(items: menuViewModels)
    }
    
    fileprivate func setupAccountMenuItemViewModel(_ menuItem: SlideMenuItemViewModel,
                                                   _ name: String) {
        
        menuItem.title = name
    }
    
}

