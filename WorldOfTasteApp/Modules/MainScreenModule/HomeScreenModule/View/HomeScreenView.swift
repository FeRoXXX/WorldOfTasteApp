//
//  HomeScreenView.swift
//  WorldOfTasteApp
//
//  Created by Vyacheslav on 06.08.2024.
//

import UIKit

final class HomeScreenView: UIView {
    
    private var navigationMenuTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.navigationMenuBackgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var navigationMenuButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.MainScreenImages.HomeScreenImages.menuButton, for: .normal)
        button.addTarget(self, action: #selector(rightSwipeAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isMenuOpen: Bool = false
    private let screenBounds = UIScreen.main.bounds
    private var homeScale = CGAffineTransform()
    private var tabBarController: UITabBarController?
    
    init(tableViewSettings: TableViewSettings, tabBarController: UITabBarController?) {
        navigationMenuTableView.delegate = tableViewSettings
        navigationMenuTableView.dataSource = tableViewSettings
        self.tabBarController = tabBarController
        super.init(frame: .zero)
        setupUI()
        setupMenuOpenAction()
        setupMenuHidingAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HomeScreenView {
    
    func setupUI() {
        setupViewSettings()
        addSubviews()
        setupConstraints()
        homeScale = contentView.transform
    }
    
    func setupViewSettings() {
        backgroundColor = Colors.navigationMenuBackgroundColor
    }
    
    func addSubviews() {
        addSubview(navigationMenuTableView)
        addSubview(contentView)
        contentView.addSubview(navigationMenuButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationMenuTableView.leftAnchor.constraint(equalTo: leftAnchor),
            navigationMenuTableView.topAnchor.constraint(equalTo: topAnchor),
            navigationMenuTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            navigationMenuTableView.rightAnchor.constraint(equalTo: centerXAnchor, constant: 90)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            navigationMenuButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 27),
            navigationMenuButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            navigationMenuButton.heightAnchor.constraint(equalToConstant: 26),
            navigationMenuButton.widthAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    func setupMenuOpenAction() {
        let gestureRecognizer = UISwipeGestureRecognizer()
        gestureRecognizer.direction = .right
        gestureRecognizer.addTarget(self, action: #selector(rightSwipeAction))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    func setupMenuHidingAction() {
        let gestureRecognizer = UISwipeGestureRecognizer()
        gestureRecognizer.direction = .left
        gestureRecognizer.addTarget(self, action: #selector(leftSwipeAction))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    func showMenu() {
        self.contentView.layer.cornerRadius = 40
        self.layer.cornerRadius = self.contentView.layer.cornerRadius
        let x = screenBounds.width * 0.8
        let originalTransform = self.contentView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
        UIView.animate(withDuration: 0.7) {
            self.contentView.transform = scaledAndTranslatedTransform
            self.tabBarController?.tabBar.alpha = 0
        } completion: { _ in
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.7) {
            self.contentView.transform = self.homeScale
            self.contentView.layer.cornerRadius = 0
            self.tabBarController?.tabBar.isHidden = false
            self.tabBarController?.tabBar.alpha = 1
        }
    }
    
    @objc func rightSwipeAction() {
        if !isMenuOpen {
            showMenu()
            isMenuOpen = true
        }
    }
    
    @objc func leftSwipeAction() {
        if isMenuOpen {
            hideMenu()
            isMenuOpen = false
        }
    }
}
