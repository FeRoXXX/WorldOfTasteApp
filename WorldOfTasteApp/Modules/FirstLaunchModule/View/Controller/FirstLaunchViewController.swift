//
//  FirstLaunchViewController.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 24.07.2024.
//

import UIKit

final class FirstLaunchViewController: UIViewController {
    
    private let contentView = FirstLaunchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setCurrentPage(number: Int) {
        contentView.setCurrentPage(number: number)
    }
}

private extension FirstLaunchViewController {
    
    func setupUI() {
        view = contentView
    }
}
