//
//  HomeViewController.swift
//  WorldOfTasteApp
//
//  Created by Vyacheslav on 06.08.2024.
//

import UIKit

typealias TableViewSettings = UITableViewDelegate & UITableViewDataSource

final class HomeViewController: UIViewController {
    
    private lazy var contentView = HomeScreenView(tableViewSettings: self, tabBarController: tabBarController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension HomeViewController: TableViewSettings {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell 
        else {
            return UITableViewCell()
        }
        cell.setupText(NavigationMenuText.getText(from: indexPath.row))
        return cell
    }
}

private extension HomeViewController {
    
    func setupUI() {
        self.view = contentView
    }
}
