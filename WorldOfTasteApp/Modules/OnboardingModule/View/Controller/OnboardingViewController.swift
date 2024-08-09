//
//  OnboardingViewController.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 24.07.2024.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let contentView = OnboardingView()
    private let dataManager = OnboardingDataManager()
    
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

private extension OnboardingViewController {
    
    func setupUI() {
        view = contentView
    }
}
