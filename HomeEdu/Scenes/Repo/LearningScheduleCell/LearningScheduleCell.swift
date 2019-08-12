//
//  LearningScheduleCell.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/14/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

class LearningScheduleCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var roomLabel: UILabel!
    
    func setDataForCell(timeSchedule: TimeSchedule) {
        timeLabel.text = "\(timeSchedule.start)h - \(timeSchedule.end)h"
        nameLabel.text = timeSchedule.name
        roomLabel.text = timeSchedule.room
    }
}
