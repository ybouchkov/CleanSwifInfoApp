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
    // var worker: TypeWorker
    
    // MARK: - SlideViewBuisnessLogic
    func prepareMenuItems() {
        let menuItemActions: [SlideMenuActionType] = [
            .account
        ]
        let response = SlideMenuItemResponse(actions: menuItemActions)
        presenter?.presentMenuItems(response: response)
    }
}
