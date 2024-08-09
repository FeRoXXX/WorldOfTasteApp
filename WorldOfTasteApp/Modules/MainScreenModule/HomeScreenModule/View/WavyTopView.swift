//
//  WavyTopView.swift
//  WorldOfTasteApp
//
//  Created by Vyacheslav on 08.08.2024.
//

import UIKit

class WavyTopView: UIView {
    
    private lazy var wavyViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "saleImage")
        return imageView
    }()
    
    private let firstViewColor = UIColor(red: 147.0 / 255.0, green: 174.0 / 255.0 , blue: 130.0 / 255.0 , alpha: 1)
    private let secondViewColor = UIColor(red: 90.0 / 255.0, green: 114.0 / 255.0 , blue: 74.0 / 255.0 , alpha: 1)
    
    private var shapeLayer: CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupWavyBorder()
        setTextToView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shapeLayer.path = createWavyPath().cgPath
    }
}

private extension WavyTopView {
    
    func setupView() {
        addSubview(wavyViewLabel)
        addSubview(saleImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            wavyViewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            wavyViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            wavyViewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            saleImageView.heightAnchor.constraint(equalToConstant: 93),
            saleImageView.widthAnchor.constraint(equalToConstant: 90),
            saleImageView.centerYAnchor.constraint(equalTo: wavyViewLabel.centerYAnchor),
            saleImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            saleImageView.leadingAnchor.constraint(equalTo: wavyViewLabel.trailingAnchor, constant: 4)
        ])
    }
    
    func setupWavyBorder() {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = createWavyPath().cgPath
        shapeLayer.fillColor = firstViewColor.cgColor
        
        self.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    func createWavyPath() -> UIBezierPath {
        let path = UIBezierPath()
        let amplitude: CGFloat = 10.0
        let wavelength: CGFloat = 85.0
        
        let y = self.bounds.height
        path.move(to: CGPoint(x: 0, y: y))
        
        for x in stride(from: 0, to: self.bounds.width, by: 1) {
            let waveY = y + amplitude * sin(x / wavelength * 2 * .pi)
            path.addLine(to: CGPoint(x: x, y: waveY))
        }
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: y))
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()
        
        return path
    }
    
    func setTextToView() {
        let attributedText = NSMutableAttributedString()
        
        let attributesFirstPart = [NSAttributedString.Key.font: Fonts.largeFont,
                                   NSAttributedString.Key.foregroundColor : Colors.whiteBackgroundColor]
        let attributesSecondPart = [NSAttributedString.Key.font: Fonts.wavyTopViewSecondPartLabelFont,
                                    NSAttributedString.Key.foregroundColor: Colors.whiteBackgroundColor]
        
        let attributedFirstString = NSMutableAttributedString(string: "Discover\n", attributes: attributesFirstPart as [NSAttributedString.Key : Any])
        let attributedSecondString = NSMutableAttributedString(string: "Your Taste!", attributes: attributesSecondPart as [NSAttributedString.Key : Any])
        
        attributedFirstString.append(attributedSecondString)
        
        wavyViewLabel.attributedText = attributedFirstString
    }
}
