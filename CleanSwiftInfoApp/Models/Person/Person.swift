//
//  Person.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 19.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol PersonRepresentable {
    
    var id: String { get set }
    var name: String { get set }
    var lastName: String { get set }
    var profileImage: String { get set }
}

/// Person Object
struct Person: PersonRepresentable {
    
    var id: String
    var name: String
    var lastName: String
    var profileImage: String
}
