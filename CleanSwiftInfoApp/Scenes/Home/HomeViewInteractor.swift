//
//  HomeViewInteractor.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 29.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol HomeViewBuisnessLogic {
    
    func prepareSomething()
}

class HomeViewInteractor: HomeViewBuisnessLogic {
    
    // MARK: - Properties
    var presenter: HomeViewPresentationLogic?
    
    // MARK: - HomeViewBuisnessLogic
    func prepareSomething() {
        
    }
}
