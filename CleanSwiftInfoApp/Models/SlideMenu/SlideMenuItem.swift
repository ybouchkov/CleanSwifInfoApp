//
//  SlideMenuItem.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

/// All menu items
enum SlideMenuActionType {
    case account

    // MARK: Images for every item
    // For example: Here, there is only one image for evey case
}

class SlideMenuItem {
    private(set) var action: SlideMenuActionType
    private(set) var position: Int
    
    init(for action: SlideMenuActionType, at position: Int) {
        self.action = action
        self.position = position
    }
}

extension SlideMenuItem: Equatable {
    
    static func == (lhs: SlideMenuItem, rhs: SlideMenuItem) -> Bool {
        return lhs.action == rhs.action && lhs.position == rhs.position
    }
}
