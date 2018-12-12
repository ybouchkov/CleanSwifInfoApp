//
//  ItemRow1TableViewCell.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 12.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

class ItemRow1TableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblIcon: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        lblTitle.font = UIFont.montserrat(ofSize: 14, style: .regular)
        lblTitle.textColor = .primaryColor
    }
}

extension ItemRow1TableViewCell: SlideMenuItemsConfigurable {
    func configure(item: SlideMenuItemItemRepresentable) {
        lblTitle.text = item.title
        if let icon = item.icon {
            lblIcon.attributedText = icon.attributedString(size: 14.0, color: .primaryColor)
        }
    }
}
