//
//  StudentInfoCell.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class StudentInfoCell: UITableViewCell, NibReusable {
    @IBOutlet weak private var infoStudentLabel: UILabel!
    @IBOutlet weak private var infoValueLabel: UILabel!
    
    func setUpInfo(infoStudent: String, infoValue: String) {
        infoStudentLabel.text = infoStudent
        infoValueLabel.text = infoValue
    }
}
