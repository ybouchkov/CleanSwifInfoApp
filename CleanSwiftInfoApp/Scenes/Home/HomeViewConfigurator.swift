//
//  HomeViewConfigurator.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 29.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

class HomeViewConfigurator {
    
    // MARK: - Singleton
    static var shared = HomeViewConfigurator()
    
    // MARK: Init
    private init() {}
    
    // MARK: - Config
    func configurate(viewController: HomeViewController) {
        let interactor = HomeViewInteractor()
        let router = HomeViewRouter()
        let presenter = HomeViewPresenter()
        
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        // Setup dataSource here ...
        
    }
}
