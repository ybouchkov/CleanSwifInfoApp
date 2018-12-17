//
//  HomeViewController.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 29.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: HomeViewBuisnessLogic?
    var router: HomeViewRoutingLogic?

    // MARK: Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineNavigationItems()
    }
    
    private func setup() {
        HomeViewConfigurator.shared.configurate(viewController: self)
    }
    
    private func lineNavigationItems() {
        // Hamburger menu
        self.navigationItem.leftBarButtonItem = menuBarButtoItem
        self.navigationItem.titleView = navigationTitleView
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
