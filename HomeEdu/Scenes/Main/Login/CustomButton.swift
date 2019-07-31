//
//  CustomButton.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton : UIButton {
    
    @IBInspectable var radios: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = radios
        self.clipsToBounds = true
    }
}
