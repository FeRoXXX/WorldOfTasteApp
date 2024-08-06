//
//  FirstLaunchViewController.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 24.07.2024.
//

import UIKit

final class FirstLaunchViewController: UIViewController {
    
    private let contentView = FirstLaunchView()
    private let dataManager = FirstLaunchDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setCurrentPage(number: Int) {
        contentView.setCurrentPage(number: number)
        guard let data = dataManager.getData(with: number)
        else {
            return
        }
        contentView.setupData(data.page)
    }
}

private extension FirstLaunchViewController {
    
    func setupUI() {
        view = contentView
    }
}
