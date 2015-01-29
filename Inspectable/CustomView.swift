//
//  CustomView.swift
//  Inspectable
//
//  Created by Motoki on 2015/01/29.
//  Copyright (c) 2015年 MotokiNarita. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {

    @IBInspectable var myBoolean : Bool = true
    @IBInspectable var myInteger : Int = 0
    @IBInspectable var myDouble : Double = 0.0
    @IBInspectable var myString : String = "IBInspectable"
    @IBInspectable var myRect : CGRect = CGRectMake(0.0, 0.0, 10.0, 10.0)
    @IBInspectable var mySize : CGSize = CGSizeMake(10.0, 10.0)
    @IBInspectable var myPoint : CGPoint = CGPointMake(0.0, 0.0)
    @IBInspectable var myFloat : CGFloat = 0.0
    @IBInspectable var myColor : UIColor = UIColor.clearColor()
    @IBInspectable var myImage : UIImage?
}
