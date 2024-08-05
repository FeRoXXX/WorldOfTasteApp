//
//  FirstLaunchView.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 24.07.2024.
//

import UIKit

final class FirstLaunchView: UIView {
    
    private let logoView: LogoView = {
        let logoView = LogoView(frame: CGRect(x: 0, y: 0, width: 317, height: 96))
        logoView.lineColor = #colorLiteral(red: 0.5215686275, green: 0.631372549, blue: 0.4509803922, alpha: 1)
        logoView.textColor = #colorLiteral(red: 0.3529411765, green: 0.4470588235, blue: 0.2901960784, alpha: 1)
        logoView.firstText = "Herbs & Spices"
        logoView.logoText = "OLDMIX"
        logoView.secondText = "Quality"
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    private let secondImageView: UIImageView = {
        let imageView = UIImageView(image: Images.PageControlImages.FirstViewImages.spicesImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        pageControl.currentPageIndicatorTintColor = Colors.pageControlActiveColor
        pageControl.pageIndicatorTintColor = Colors.pageControlInactiveColor
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [aboutPageText, fullDescriptionText])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 13
        stackView.axis = .vertical
        return stackView
    }()
    
    private let aboutPageText: UILabel = {
        let aboutPageText: UILabel = UILabel()
        aboutPageText.font = Fonts.largeFont
        aboutPageText.numberOfLines = 0
        aboutPageText.text = "Fancy Another Blast Of Feel-Good Flavors?"
        aboutPageText.textColor = Colors.activeElementColor
        aboutPageText.translatesAutoresizingMaskIntoConstraints = false
        return aboutPageText
    }()
    
    private let fullDescriptionText: UILabel = {
        let fullDescriptionText: UILabel = UILabel()
        fullDescriptionText.text = "Old Mix helps you to find authentic herbs and spices bursting with flavours while brimming your confidence."
        fullDescriptionText.font = Fonts.mediumFont
        fullDescriptionText.numberOfLines = 0
        fullDescriptionText.textColor = Colors.descriptionTextColor
        fullDescriptionText.translatesAutoresizingMaskIntoConstraints = false
        return fullDescriptionText
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
        addSubview(textStackView)
        addSubview(pageControl)
        addSubview(progressButton)
        addSubview(logoView)
        addSubview(secondImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 317),
            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 53),
            logoView.heightAnchor.constraint(equalToConstant: 96),
            secondImageView.heightAnchor.constraint(equalToConstant: 340),
            secondImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            secondImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            secondImageView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 22),
            pageControl.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            pageControl.leftAnchor.constraint(equalTo: self.leftAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 15),
            progressButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            progressButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -21),
            progressButton.heightAnchor.constraint(equalToConstant: 86),
            progressButton.widthAnchor.constraint(equalToConstant: 86),
            textStackView.bottomAnchor.constraint(equalTo: progressButton.topAnchor, constant: -8),
            textStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21),
            textStackView.heightAnchor.constraint(equalToConstant: 189)
        ])
    }
}
