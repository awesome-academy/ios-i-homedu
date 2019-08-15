//
//  ExamScheduleCell.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/7/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable

final class ExamScheduleCell: UITableViewCell, NibReusable {
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var examDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    func setDataForCell(subjectSchedule: SubjectSchedule) {
        subjectNameLabel.text = subjectSchedule.name
        examDateLabel.text = subjectSchedule.date
        startTimeLabel.text = subjectSchedule.start.toString()
        roomLabel.text = subjectSchedule.room
        idLabel.text = subjectSchedule.id.toString()
    }
}
