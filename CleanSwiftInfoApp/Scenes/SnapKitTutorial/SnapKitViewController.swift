//
//  SnapKitViewController.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 13.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit
import SnapKit

protocol SnapKitDisplayLogic {
    // display something
}

/// Example of how we can use SnapKit.
class SnapKitViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    var router: SnapKitNavigationLogic?
    var interactor: SnapKitBuisnessLogic?
    
    private var snapKitView: SnapKitView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SnapKit Simple example"
        runView()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        SnapKitConfigurator.shared.configuration(viewController: self)
    }
    
    private func runView() {
        snapKitView = SnapKitView()
        self.view.addSubview(snapKitView)
        
        // Making constraints
        snapKitView.snp.makeConstraints { (make) in
//            make.left.right.bottom.top.equalTo(self.view) // first way
            make.edges.equalTo(self.view) // second way
        }
    }
}
