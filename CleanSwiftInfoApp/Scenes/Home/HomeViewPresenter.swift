//
//  HomeViewPresenter.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 29.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

protocol HomeViewPresentationLogic {
    
    func presentSomething()
}

class HomeViewPresenter: HomeViewPresentationLogic {
    
    // MARK: - Properties
    weak var viewController: HomeViewController?
    
    // MARK: - HomeViewPresentationLogic
    func presentSomething() {
        
    }
    
}
