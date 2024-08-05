//
//  LogoView.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 05.08.2024.
//

import UIKit

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
        
        logoTextLayer.fontSize = 60 - (baseLogoScale - frame.width)
        logoTextLayer.alignmentMode = .center
        
        secondTextLayer.fontSize = 14
        secondTextLayer.alignmentMode = .center
        let topFrameMark = firstTextLayer.preferredFrameSize()
        let bottomFrameMark = secondTextLayer.preferredFrameSize()
        let centerFrameMark = logoTextLayer.preferredFrameSize()
        let frameWidth = frame.width
        let frameHeight = frame.height
        let centerLeftMark = frameWidth/2 - topFrameMark.width/2
        let centerTopMark = topFrameMark.height/2
        let widthPadding: CGFloat = 16
        let heighPadding: CGFloat = 25
        
        path.move(to: CGPoint(x: centerLeftMark, y: centerTopMark))
        path.addLine(to: CGPoint(x: widthPadding, y: centerTopMark))
        path.move(to: CGPoint(x: widthPadding, y: centerTopMark))
        path.addQuadCurve(to: CGPoint(x: 0, y: heighPadding), controlPoint: CGPoint(x: 0, y: centerTopMark))
        path.move(to: CGPoint(x: 0, y: heighPadding))
        path.addLine(to: CGPoint(x: 0, y: frameHeight - heighPadding))
        path.move(to: CGPoint(x: 0, y: frameHeight - heighPadding))
        path.addQuadCurve(to: CGPoint(x: widthPadding, y: frameHeight - centerTopMark), controlPoint: CGPoint(x: 0, y: frameHeight - centerTopMark))
        path.move(to: CGPoint(x: widthPadding, y: frameHeight - centerTopMark))
        path.addLine(to: CGPoint(x: centerLeftMark, y: frameHeight - centerTopMark))
        
        path.move(to: CGPoint(x: frameWidth - centerLeftMark, y: centerTopMark))
        path.addLine(to: CGPoint(x: frameWidth - widthPadding, y: centerTopMark))
        path.move(to: CGPoint(x: frameWidth - centerLeftMark, y: frameHeight - centerTopMark))
        path.addLine(to: CGPoint(x: frameWidth - widthPadding, y: frameHeight - centerTopMark))
        path.move(to: CGPoint(x: frameWidth, y: heighPadding))
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight - heighPadding))
        path.move(to: CGPoint(x: frameWidth - widthPadding, y: centerTopMark))
        path.addQuadCurve(to: CGPoint(x: frameWidth, y: heighPadding), controlPoint: CGPoint(x: frameWidth, y: centerTopMark))
        path.move(to: CGPoint(x: frameWidth, y: frameHeight - heighPadding))
        path.addQuadCurve(to: CGPoint(x: frameWidth - widthPadding, y: frameHeight - centerTopMark), controlPoint: CGPoint(x: frameWidth, y: frameHeight - centerTopMark))
        lineLayer.fillColor = UIColor.blue.cgColor
        
        lineLayer.path = path.cgPath
        
        lineLayer.fillColor = .none
        lineLayer.lineWidth = 1
        
        lineLayer.strokeEnd = 1
        layer.addSublayer(lineLayer)
        firstTextLayer.frame = CGRect(x: centerLeftMark, y: 0, width: topFrameMark.width, height: topFrameMark.height)
        layer.addSublayer(firstTextLayer)
        logoTextLayer.frame = CGRect(x: (frameWidth - centerFrameMark.width)/2, y: (frameHeight - centerFrameMark.height)/2, width: centerFrameMark.width, height: centerFrameMark.height)
        layer.addSublayer(logoTextLayer)
        secondTextLayer.frame = CGRect(x: centerLeftMark, y: frameHeight - bottomFrameMark.height, width: topFrameMark.width, height: bottomFrameMark.height)
        layer.addSublayer(secondTextLayer)
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
