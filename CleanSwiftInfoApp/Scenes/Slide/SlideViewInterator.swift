//
//  SlideViewInterator.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol SlideViewBuisnessLogic {
    
    func prepareMenuItems()
}

class SlideViewInteractor: SlideViewBuisnessLogic {
    
    var presenter: SlideViewPresentationLogic?
    // Note: var worker: TypeWorker
    
    // MARK: - SlideViewBuisnessLogic
    func prepareMenuItems() {
        let menuItemActions: [SlideMenuActionType] = [
            .account,
            .firstSection,
            .snapKitTutorial,
            .home,
            .alamofire,
            .itemRow4,
            .itemRow5,
            .separator,
            .more,
            .secondSectionRow1,
            .secondSectionRow2,
            .separator
        ]
        let response = SlideMenuItemResponse(actions: menuItemActions)
        presenter?.presentMenuItems(response: response)
    }
}
