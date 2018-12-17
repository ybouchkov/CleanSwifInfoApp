//
//  SlideViewController.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 28.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit

protocol SlideMenuDisplayLogic {
    
    func displayMenuItems(items: [SlideMenuItemViewModel])
}

class SlideViewController: UITableViewController, SlideMenuDisplayLogic {

    // MARK: - Properties
    var interactor: SlideViewBuisnessLogic?
    var router: SlideViewRoutingLogic?
    
    // DataProvider
    var menuProvider = SlideMenuDataProvider(rows: [])
    
    // MARK: - Lifecycleс
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
        
        prepareItems()
    }
    
    // MARK: - Setup
    private func setup() {
        SlideViewConfigurator.shared.configurate(viewController: self)
    }
    
    private func prepareItems() {
        interactor?.prepareMenuItems()
        tableView.tableFooterView = UIView() // removing the empty cells from tableView
    }
    
    // MARK: - SlideMenuDisplayLogic
    func displayMenuItems(items: [SlideMenuItemViewModel]) {
        self.menuProvider.update(rows: items)
        tableView.reloadData()
    }
    
}

// MARK: - Table view data source
extension SlideViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return menuProvider.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.menuProvider.numberOfItems(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = self.menuProvider[indexPath]
        guard let reuseIdentifier = viewModel?.reuseIdentifier else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("Slide Menu Cell Not Found -- ReuseIdentifier: \(reuseIdentifier)")
        }
        
        guard let configurableCell = cell as? SlideMenuItemsConfigurable else {
            fatalError("Slide Menu Cell Must Be SlideMenuItemConfigurable")
        }
        
        configurableCell.configure(item: viewModel!)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SlideViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        guard let model = self.menuProvider[indexPath] else { fatalError("Cannot find the row") }
        router?.navigateTo(selectedMenuItem: model)
    }
}
