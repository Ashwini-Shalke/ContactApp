//
//  Extensions.swift
//  ContactApplication
//
//  Created by Ashwini shalke on 02/10/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func round() {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

extension UIColor {
    
    static var lightGreen = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1.0)
    
    static var gradientBlue = UIColor(red: 223/255, green: 246/255, blue: 241/255, alpha: 1.0)
    
    static var customGray = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
}

extension UIView  {
    
    func setBackgroundGradientColor(colorOne : UIColor, colorTwo : UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.addSublayer(gradientLayer)
        
    }
}
