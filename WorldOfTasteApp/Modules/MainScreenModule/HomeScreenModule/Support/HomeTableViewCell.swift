//
//  HomeTableViewCell.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 08.08.2024.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    private var menuItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeTableViewCell {
    
    func setupUI() {
        setupViewSettings()
        addSubviews()
        setupConstraints()
    }
    
    func setupViewSettings() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        backgroundColor = .clear
    }
    
    func addSubviews() {
        addSubview(menuItemLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            menuItemLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuItemLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuItemLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
    }
}

extension HomeTableViewCell {
    
    func setupText(_ text: String) {
        menuItemLabel.text = text
    }
    
    static var identifier: String{
        String(describing: HomeTableViewCell.self)
    }
}
