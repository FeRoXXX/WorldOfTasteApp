//
//  LogoView.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 05.08.2024.
//

import UIKit

fileprivate struct SizeSettings {
    let topFrameMark: CGSize
    let bottomFrameMark: CGSize
    let centerFrameMark: CGSize
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let centerLeftMark: CGFloat
    let centerTopMark: CGFloat
    let widthPadding: CGFloat = 16
    let heighPadding: CGFloat = 25
}

final class LogoView: UIView {
    
    fileprivate var lineLayer = CAShapeLayer()
    fileprivate var firstTextLayer = CATextLayer()
    fileprivate var logoTextLayer = CATextLayer()
    fileprivate var secondTextLayer = CATextLayer()
    fileprivate var path = UIBezierPath()
    
    var lineColor: UIColor = UIColor.white {
        didSet {
            lineLayer.strokeColor = lineColor.cgColor
        }
    }
    
    var firstText: String = "" {
        didSet {
            firstTextLayer.string = firstText
        }
    }
    
    var logoText: String = "" {
        didSet {
            logoTextLayer.string = logoText
        }
    }
    
    var secondText: String = "" {
        didSet {
            secondTextLayer.string = secondText
        }
    }
    
    var textColor: UIColor = UIColor.white {
        didSet {
            firstTextLayer.foregroundColor = textColor.cgColor
            secondTextLayer.foregroundColor = textColor.cgColor
            logoTextLayer.foregroundColor = textColor.cgColor
        }
    }
    
    fileprivate func createLogo() {
        self.backgroundColor = .clear
        let baseLogoScale: CGFloat = 317
        
        firstTextLayer.fontSize = 10
        firstTextLayer.alignmentMode = .center
        
        logoTextLayer.fontSize = 50 - (baseLogoScale - frame.width)
        logoTextLayer.alignmentMode = .center
        
        secondTextLayer.fontSize = 14
        secondTextLayer.alignmentMode = .center
        let sizeSettings = SizeSettings(topFrameMark: firstTextLayer.preferredFrameSize(),
                                        bottomFrameMark: secondTextLayer.preferredFrameSize(),
                                        centerFrameMark: logoTextLayer.preferredFrameSize(),
                                        frameWidth: frame.width,
                                        frameHeight: frame.height,
                                        centerLeftMark: frame.width/2 - firstTextLayer.preferredFrameSize().width/2,
                                        centerTopMark: firstTextLayer.preferredFrameSize().height/2)
        createLeftElement(settings: sizeSettings)
        createRightElement(settings: sizeSettings)
        lineLayer.fillColor = UIColor.blue.cgColor
        
        lineLayer.path = path.cgPath
        
        lineLayer.fillColor = .none
        lineLayer.lineWidth = 1
        
        lineLayer.strokeEnd = 1
        layer.addSublayer(lineLayer)
        
        createTextLayers(settings: sizeSettings)
        layer.addSublayer(firstTextLayer)
        layer.addSublayer(logoTextLayer)
        layer.addSublayer(secondTextLayer)
    }
    
    fileprivate func createLeftElement(settings: SizeSettings) {
        path.move(to: CGPoint(x: settings.centerLeftMark, 
                              y: settings.centerTopMark))
        path.addLine(to: CGPoint(x: settings.widthPadding, 
                                 y: settings.centerTopMark))
        path.move(to: CGPoint(x: settings.widthPadding, 
                              y: settings.centerTopMark))
        path.addQuadCurve(to: CGPoint(x: 0, 
                                      y: settings.heighPadding), 
                          controlPoint: CGPoint(x: 0,
                                                y: settings.centerTopMark))
        path.move(to: CGPoint(x: 0, 
                              y: settings.heighPadding))
        path.addLine(to: CGPoint(x: 0, 
                                 y: settings.frameHeight - settings.heighPadding))
        path.move(to: CGPoint(x: 0, 
                              y: settings.frameHeight - settings.heighPadding))
        path.addQuadCurve(to: CGPoint(x: settings.widthPadding, 
                                      y: settings.frameHeight - settings.centerTopMark), 
                          controlPoint: CGPoint(x: 0,
                                                y: settings.frameHeight - settings.centerTopMark))
        path.move(to: CGPoint(x: settings.widthPadding, 
                              y: settings.frameHeight - settings.centerTopMark))
        path.addLine(to: CGPoint(x: settings.centerLeftMark, 
                                 y: settings.frameHeight - settings.centerTopMark))
    }
    
    fileprivate func createRightElement(settings: SizeSettings) {
        path.move(to: CGPoint(x: settings.frameWidth - settings.centerLeftMark,
                              y: settings.centerTopMark))
        path.addLine(to: CGPoint(x: settings.frameWidth - settings.widthPadding,
                                 y: settings.centerTopMark))
        path.move(to: CGPoint(x: settings.frameWidth - settings.centerLeftMark,
                              y: settings.frameHeight - settings.centerTopMark))
        path.addLine(to: CGPoint(x: settings.frameWidth - settings.widthPadding,
                                 y: settings.frameHeight - settings.centerTopMark))
        path.move(to: CGPoint(x: settings.frameWidth,
                              y: settings.heighPadding))
        path.addLine(to: CGPoint(x: settings.frameWidth,
                                 y: settings.frameHeight - settings.heighPadding))
        path.move(to: CGPoint(x: settings.frameWidth - settings.widthPadding,
                              y: settings.centerTopMark))
        path.addQuadCurve(to: CGPoint(x: settings.frameWidth,
                                      y: settings.heighPadding),
                          controlPoint: CGPoint(x: settings.frameWidth,
                                                y: settings.centerTopMark))
        path.move(to: CGPoint(x: settings.frameWidth,
                              y: settings.frameHeight - settings.heighPadding))
        path.addQuadCurve(to: CGPoint(x: settings.frameWidth - settings.widthPadding,
                                      y: settings.frameHeight - settings.centerTopMark),
                          controlPoint: CGPoint(x: settings.frameWidth,
                                                y: settings.frameHeight - settings.centerTopMark))
    }
    
    fileprivate func createTextLayers(settings: SizeSettings) {
        firstTextLayer.frame = CGRect(x: settings.centerLeftMark,
                                      y: 0,
                                      width: settings.topFrameMark.width,
                                      height: settings.topFrameMark.height)
        logoTextLayer.frame = CGRect(x: (settings.frameWidth - settings.centerFrameMark.width)/2,
                                     y: (settings.frameHeight - settings.centerFrameMark.height)/2,
                                     width: settings.centerFrameMark.width,
                                     height: settings.centerFrameMark.height)
        secondTextLayer.frame = CGRect(x: settings.centerLeftMark,
                                       y: settings.frameHeight - settings.bottomFrameMark.height,
                                       width: settings.topFrameMark.width,
                                       height: settings.bottomFrameMark.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createLogo()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
