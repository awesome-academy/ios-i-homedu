//
//  CustomButton.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

@IBDesignable class CustomButtonLogin: UIButton {
    
    @IBInspectable var radius: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
