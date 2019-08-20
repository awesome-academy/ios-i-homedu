//
//  LearningSchedule.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/9/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class LearningSchedule: Mappable {    
    var studentId: String?
    var days = [DaySchedule]()
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        studentId <- map["student_id"]
        days <- map["days"]
    }
}
