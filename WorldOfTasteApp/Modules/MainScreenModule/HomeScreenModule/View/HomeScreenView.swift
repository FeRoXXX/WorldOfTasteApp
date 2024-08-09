//
//  HomeScreenView.swift
//  WorldOfTasteApp
//
//  Created by Vyacheslav on 06.08.2024.
//

import UIKit

final class HomeScreenView: UIView {
    
    private lazy var topWavyView: WavyTopView = {
       let view = WavyTopView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeScreenView {
    
    func setupView() {
        addSubview(topWavyView)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            topWavyView.topAnchor.constraint(equalTo: self.topAnchor),
            topWavyView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topWavyView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topWavyView.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
}
