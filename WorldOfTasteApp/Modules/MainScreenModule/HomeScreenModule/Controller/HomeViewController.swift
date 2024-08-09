//
//  HomeViewController.swift
//  WorldOfTasteApp
//
//  Created by Vyacheslav on 06.08.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeScreenView: HomeScreenView = {
        let view = HomeScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
}

private extension HomeViewController {
    
    func setupController() {
        view.backgroundColor = .white
        
        view.addSubview(homeScreenView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            homeScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeScreenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
