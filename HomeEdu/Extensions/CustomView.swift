//
//  CustomView.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/24/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView{
    @IBInspectable var radios: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = radios
        self.clipsToBounds = true
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
}
