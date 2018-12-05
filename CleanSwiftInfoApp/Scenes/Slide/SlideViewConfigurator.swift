//
//  SlideViewConfigurator.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

class SlideViewConfigurator {
    
    // MARK: - Singleton
    static var shared: SlideViewConfigurator = SlideViewConfigurator()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Config
    func configurate(viewController: SlideViewController) {
        let interactor = SlideViewInteractor()
        let router = SlideViewRouter()
        let presenter = SlideViewPresenter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        presenter.viewController = viewController
        interactor.presenter = presenter
        
        router.viewController = viewController
        // set data here if there it is...
        // router.dataStore = interactor
    }
}
