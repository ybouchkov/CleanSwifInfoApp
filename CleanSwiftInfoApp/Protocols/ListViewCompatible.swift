//
//  ListViewCompatible.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 30.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol ListViewCompatible {
    
    var reuseIdentifier: String { get }
    
}

protocol TableViewCompatible: ListViewCompatible {
    // Add something
}

protocol CollectionViewCompatible: ListViewCompatible {
    // Add something
}

