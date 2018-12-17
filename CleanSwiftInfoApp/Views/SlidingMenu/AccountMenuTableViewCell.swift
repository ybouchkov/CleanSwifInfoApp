//
//  AccountMenuTableViewCell.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 30.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

class AccountMenuTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var accountImageView: UIImageView!
    @IBOutlet private weak var lblAccountName: UILabel!
    @IBOutlet private weak var iconLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        self.contentView.backgroundColor = .primaryColor
        self.lblAccountName.textColor = .white
        self.lblAccountName.font = UIFont.montserrat(ofSize: 15.0, style: .bold)
        self.iconLabel.attributedText = MWGIconFont.profile.attributedString(size: 14.0, color: .white)
    }
}

extension AccountMenuTableViewCell: SlideMenuItemsConfigurable {
    
    func configure(item: SlideMenuItemItemRepresentable) {
        self.lblAccountName.text = item.title
    }
}
