//
//  ScoreProgessCell.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/15/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

final class ScoreProgessCell: UITableViewCell, NibReusable {
    @IBOutlet weak var titleTermLabel: UILabel!
    @IBOutlet weak var behaviourLabel: UILabel!
    @IBOutlet weak var gradeTermLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    func setDataForCell(_ scoreProgressValue: ScoreProgressValue) {
        titleTermLabel.text = scoreProgressValue.title
        behaviourLabel.text = "\(scoreProgressValue.behaviour ?? 0)"
        gradeTermLabel.text = String(format:"%.1f",
                                     scoreProgressValue.gradeTermScore ?? 0)
        totalScoreLabel.text = String(format:"%.1f",
                                      scoreProgressValue.totalScore ?? 0)
    }
}
