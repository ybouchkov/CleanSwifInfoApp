//
//  SlideMenuItemViewModel.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol SlideMenuItemsConfigurable {
    
    func configure(item: SlideMenuItemItemRepresentable)
}

protocol SectionHeaederRepresentable {
    
    var section: String? { get set }
}

protocol AccountInfoRepresentable {
    
    var title: String? { get }
}

protocol ActionRepresentable {
    
    var title: String? { get set }
    var icon: MWGIconFont? { get set }
}

protocol SlideMenuItemItemRepresentable: AccountInfoRepresentable, SectionHeaederRepresentable, ActionRepresentable {}

enum SlideMenuRepresentableItemFactory {
    
    static func reuseIdentifier(forMenuAction action: SlideMenuActionType) -> String {
        switch action {
        case .account:
            return "AccountMenuItemCell"
        case .firstSection, .more:
            return "SectionHeaderTitleCell"
        case .snapKitTutorial,
             .home,
             .itemRow3,
             .itemRow4,
             .itemRow5,
             .secondSectionRow1,
             .secondSectionRow2:
            return "ItemRow1TableViewCell"
        case .separator:
            return "SpaceTableViewCell"
        }
    }
}

class SlideMenuItemViewModel: SlideMenuItem, TableViewCompatible, SlideMenuItemItemRepresentable {
    
    // MARK: - Representation of all menu rows
    var title: String?
    
    var icon: MWGIconFont?
        
    var section: String?
    
    var reuseIdentifier: String
    
    // MARK: - Identifiers
    override init(for action: SlideMenuActionType, at position: Int) {
        self.reuseIdentifier = SlideMenuRepresentableItemFactory.reuseIdentifier(forMenuAction: action)
        super.init(for: action, at: position)
    }
}
