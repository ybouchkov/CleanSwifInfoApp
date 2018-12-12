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
    // Maybe you can add some header here
    case account
    
    // Other section
    case firstSection
    case itemRow1
    case itemRow2
    case itemRow3
    case itemRow4
    case itemRow5
    case more
    case secondSectionRow1
    case secondSectionRow2
    case separator
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
