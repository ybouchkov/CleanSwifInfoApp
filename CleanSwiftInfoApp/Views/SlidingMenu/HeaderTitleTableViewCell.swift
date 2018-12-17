//
//  HeaderTitleTableViewCell.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 11.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

class HeaderTitleTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var lblTitle: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // MARK: - Setup
    
    fileprivate func setup() {
        self.lblTitle.textColor = .textGrayColor
        self.lblTitle.font = UIFont.montserrat(ofSize: 15.0, style: .bold)
    }

}

// MARK: - SlideMenuItemsConfigurable
extension HeaderTitleTableViewCell: SlideMenuItemsConfigurable {
    
    func configure(item: SlideMenuItemItemRepresentable) {
        self.lblTitle.text = item.title
    }
    
}
