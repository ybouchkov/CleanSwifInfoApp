//
//  DataConfigurator.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 18.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

class DataConfiguator {
    
    // MARK: - Singleton
    static var shared = DataConfiguator()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Set up
    func configure(withController viewController: DataViewController) {
        let interactor = DataInteractor()
        let presenter = DataPresenter()
        let router = DataRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        presenter.viewController = viewController
        interactor.presenter = presenter
        
        router.viewController = viewController
        
    }
}
