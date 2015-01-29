//
//  GradationView.swift
//  Inspectable
//
//  Created by Motoki on 2015/01/28.
//  Copyright (c) 2015年 MotokiNarita. All rights reserved.
//

import UIKit

@IBDesignable class GradationView: UIView {
    
    @IBInspectable var gradationStartColor : UIColor = UIColor.whiteColor()
    @IBInspectable var gradationEndColor : UIColor = UIColor.blackColor()
    
    @IBInspectable var gradationXPosition : CGFloat = 0.5
    @IBInspectable var gradationYPosition : CGFloat = 0.5
    @IBInspectable var circleSize : CGFloat = 1.0

    override func drawRect(rect: CGRect) {
        
        var startRed: CGFloat = 0
        var startGreen: CGFloat = 0
        var startBlue: CGFloat = 0
        var startAlpha: CGFloat = 0
        self.gradationStartColor.getRed(&startRed, green: &startGreen, blue: &startBlue, alpha: &startAlpha)
        
        var endRed: CGFloat = 0
        var endGreen: CGFloat = 0
        var endBlue: CGFloat = 0
        var endAlpha: CGFloat = 0
        self.gradationEndColor.getRed(&endRed, green: &endGreen, blue: &endBlue, alpha: &endAlpha)
        
        // コンテキストの取得
        var context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextAddEllipseInRect(context, self.frame)
        
        var colorSpaceRef:CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()
        var components:[CGFloat] = [
            startRed, startGreen, startBlue, startAlpha,
            endRed, endGreen, endBlue, endAlpha,
        ]
        
        var locations:[CGFloat] = [ 0.0, 1.0 ]
        let locationCount = UInt(locations.count)
        var gradientRef: CGGradientRef = CGGradientCreateWithColorComponents(colorSpaceRef, components, locations, locationCount)
        
        var frame:CGRect = self.bounds
        var radius:CGFloat = CGRectGetWidth(frame)
        
        var startCenter: CGPoint = frame.origin
        startCenter.x += frame.size.width  * self.gradationXPosition
        startCenter.y += frame.size.height * self.gradationYPosition
        
        var endCenter = startCenter
        
        var startRadius: CGFloat = 0.0
        var endRadius  : CGFloat = CGRectGetWidth(self.bounds) * self.circleSize
        
        CGContextDrawRadialGradient(context, gradientRef, startCenter, startRadius, endCenter, endRadius, CGGradientDrawingOptions(kCGGradientDrawsAfterEndLocation))
        
        CGContextRestoreGState(context)
    }
}
