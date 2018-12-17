//
//  SeparatorTableViewCell.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 12.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

class SeparatorTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var spaceView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        spaceView.backgroundColor = UIColor.black.withAlphaComponent(0.12)
    }

}

// MARK: SlideMenuItemsConfigurable
extension SeparatorTableViewCell: SlideMenuItemsConfigurable {
    
    func configure(item: SlideMenuItemItemRepresentable) {
        // Do something if needed
    }
}
