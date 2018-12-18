//
//  SlideViewPresenter.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol SlideViewPresentationLogic {
    
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
                setupAccountMenuItemViewModel(menuItem, "Account") // shoud be localized!
            case .firstSection:
                menuItem = SlideMenuItemViewModel(for: .firstSection, at: 1)
                setupHeaderTitleCellViewModel(menuItem, "Section Title") // should be localized!
            case .snapKitTutorial:
                menuItem = SlideMenuItemViewModel(for: .snapKitTutorial, at: 2)
                setupActionTitleCellViewModel(menuItem, "SnapKit Example", .edit)
            case .home:
                menuItem = SlideMenuItemViewModel(for: .home, at: 3)
                setupActionTitleCellViewModel(menuItem, "Home", .office)
            case .alamofire:
                menuItem = SlideMenuItemViewModel(for: .alamofire, at: 4)
                setupActionTitleCellViewModel(menuItem, "Using Alamofire", .newspaper)
            case .itemRow4:
                menuItem = SlideMenuItemViewModel(for: .itemRow4, at: 5)
                setupActionTitleCellViewModel(menuItem, "ItemRow4", .dice)
            case .itemRow5:
                menuItem = SlideMenuItemViewModel(for: .itemRow5, at: 6)
                setupActionTitleCellViewModel(menuItem, "ItemRow5", .home)
            case .more:
                menuItem = SlideMenuItemViewModel(for: .more, at: 7)
                setupHeaderTitleCellViewModel(menuItem, "Second Section Title")
            case .secondSectionRow1:
                menuItem = SlideMenuItemViewModel(for: .secondSectionRow1, at: 8)
                setupActionTitleCellViewModel(menuItem, "ItemRow1", .home)
            case .secondSectionRow2:
                menuItem = SlideMenuItemViewModel(for: .secondSectionRow2, at: 9)
                setupActionTitleCellViewModel(menuItem, "ItemRow2", .profile)
            case .separator:
                menuItem = SlideMenuItemViewModel(for: .separator, at: 10)
                
            }
            
            return menuItem
        }
        
        // You can add it here some sorted function by position paratmeters e.g
        viewController?.displayMenuItems(items: menuViewModels)
    }
    
    fileprivate func setupAccountMenuItemViewModel(_ menuItem: SlideMenuItemViewModel,
                                                   _ name: String) {
        
        menuItem.title = name
    }
    
    fileprivate func setupHeaderTitleCellViewModel(_ menuItem: SlideMenuItemViewModel,
                                                   _ section: String) {
        menuItem.title = section
    }
    
    fileprivate func setupActionTitleCellViewModel(_ menuItem: SlideMenuItemViewModel,
                                                   _ title: String,
                                                   _ icon: MWGIconFont) {
        menuItem.title = title
        menuItem.icon = icon
    }
    
}
