//
//  FirstLaunchView.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 24.07.2024.
//

import UIKit

final class FirstLaunchView: UIView {
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = Colors.pageControlActiveColor
        pageControl.pageIndicatorTintColor = Colors.pageControlInactiveColor
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private let progressButton: ProgressButton = {
        let progress = ProgressButton(frame: CGRect(x: 0, y: 0, width: 86, height: 86), lineWidth: 5, rounded: true)
        progress.buttonColor = Colors.activeElementColor
        progress.buttonImage = Images.SystemImages.arrowRight
        progress.imageColor = Colors.activeElementTintColor
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        progressButton.progress = 0.5
        progressButton.progressColor = .black
        progressButton.trackColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCurrentPage(number: Int) {
        pageControl.currentPage = number
    }
}

private extension FirstLaunchView {
    
    func setupUI() {
        backgroundColor = Colors.whiteBackgroundColor
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(pageControl)
        addSubview(progressButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            pageControl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 21),
            progressButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            progressButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -21),
            progressButton.heightAnchor.constraint(equalToConstant: 86),
            progressButton.widthAnchor.constraint(equalToConstant: 86),

        ])
    }
}
