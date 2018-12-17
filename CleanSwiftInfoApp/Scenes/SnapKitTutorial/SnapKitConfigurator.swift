//
//  SnapKitConfigurator.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 13.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

class SnapKitConfigurator {
    
    static var shared: SnapKitConfigurator = SnapKitConfigurator()
    
    // MARK: Singleton
    private init () {}
    
    // MARK: - Configuration
    func configuration(viewController: SnapKitViewController) {
        let interator = SnapKitInteractor()
        let router = SnapKitRouter()
        let presenter = SnapKitPresenter()
        
        viewController.interactor = interator
        viewController.router = router
        
        presenter.viewController = viewController
        interator.presenter = presenter
        
        router.viewController = viewController
    }
    
}
