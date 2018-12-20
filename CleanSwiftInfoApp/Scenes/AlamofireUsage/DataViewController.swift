//
//  DataViewController.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 18.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

protocol DataViewDisplayLogic {
    
    // Note: func displaySomething()
}

class DataViewController: UIViewController, DataViewDisplayLogic {

    // MARK: - IBOutlets & Properties
    var router: DataRouteLogic?
    var interactor: DataBuisnessLogic?
        
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - DataViewDisplayLogic
    
    // MARK: - Set up
    private func setup() {
        self.title = "Simple REST requests"
        DataConfiguator.shared.configure(withController: self)
    }
}

typealias ViewControllerSource = DataViewController

// MARK: - DataViewController & UITableViewDataSource
extension ViewControllerSource: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0 // data provider here
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // data provider here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
