//
//  OnboardingView.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 24.07.2024.
//

import UIKit

final class OnboardingView: UIView {
    
    private let logoView: LogoView = {
        let logoView = LogoView(frame: CGRect(x: 0, 
                                              y: 0,
                                              width: 317,
                                              height: 96))
        logoView.lineColor = #colorLiteral(red: 0.5215686275, green: 0.631372549, blue: 0.4509803922, alpha: 1)
        logoView.textColor = #colorLiteral(red: 0.3529411765, green: 0.4470588235, blue: 0.2901960784, alpha: 1)
        logoView.firstText = "Herbs & Spices"
        logoView.logoText = "МИР ВКУСА"
        logoView.secondText = "Quality"
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    private let secondImageView: UIImageView = {
        let imageView = UIImageView(image: Images.OnboardingImages.FirstViewImages.spicesImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.transform = CGAffineTransform(scaleX: 1.5, 
                                                  y: 1.5)
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
        aboutPageText.textColor = Colors.activeElementColor
        aboutPageText.translatesAutoresizingMaskIntoConstraints = false
        return aboutPageText
    }()
    
    private let fullDescriptionText: UILabel = {
        let fullDescriptionText: UILabel = UILabel()
        fullDescriptionText.font = Fonts.mediumFont
        fullDescriptionText.numberOfLines = 0
        fullDescriptionText.textColor = Colors.descriptionTextColor
        fullDescriptionText.translatesAutoresizingMaskIntoConstraints = false
        return fullDescriptionText
    }()
    
    private let progressButton: ProgressButton = {
        let progress = ProgressButton(frame: CGRect(x: 0, 
                                                    y: 0,
                                                    width: 86,
                                                    height: 86),
                                      lineWidth: 5,
                                      rounded: true)
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
    
    func setupData(_ data: [Page]) {
        aboutPageText.attributedText = createAttributedString(from: data[0].string, 
                                                              with: data[0].runs)
        fullDescriptionText.attributedText = createAttributedString(from: data[1].string,
                                                                    with: data[1].runs)
    }
}

private extension OnboardingView {
    
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
            logoView.heightAnchor.constraint(equalToConstant: 96)
        ])
        NSLayoutConstraint.activate([
            secondImageView.heightAnchor.constraint(equalToConstant: 340),
            secondImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            secondImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, 
                                                     constant: 44),
            secondImageView.topAnchor.constraint(equalTo: logoView.bottomAnchor, 
                                                 constant: 22)
        ])
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, 
                                                constant: -10),
            pageControl.leftAnchor.constraint(equalTo: self.leftAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 15)
        ])
        NSLayoutConstraint.activate([
            progressButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            progressButton.rightAnchor.constraint(equalTo: self.rightAnchor, 
                                                  constant: -21),
            progressButton.heightAnchor.constraint(equalToConstant: 86),
            progressButton.widthAnchor.constraint(equalToConstant: 86)
        ])
        NSLayoutConstraint.activate([
            textStackView.bottomAnchor.constraint(equalTo: progressButton.topAnchor, 
                                                  constant: -8),
            textStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, 
                                                   constant: 21),
            textStackView.heightAnchor.constraint(equalToConstant: 189)
        ])
    }
    
    func createAttributedString(from string: String, with runs: [Run]) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        
        for run in runs {
            let range = NSRange(location: run.range[0], length: run.range[1])
            var attributes: [NSAttributedString.Key: Any] = [:]
            
            let fontName = run.attributes.font.name
            let fontSize = CGFloat(run.attributes.font.size)
            if let font = UIFont(name: fontName, size: fontSize) {
                attributes[.font] = font
            }
            
            if run.attributes.color.count == 3 {
                let color = UIColor(
                    red: CGFloat(run.attributes.color[0]) / 255.0,
                    green: CGFloat(run.attributes.color[1]) / 255.0,
                    blue: CGFloat(run.attributes.color[2]) / 255.0,
                    alpha: 1.0
                )
                attributes[.foregroundColor] = color
            }
            
            attributedString.addAttributes(attributes, range: range)
        }
        
        return attributedString
    }
}
