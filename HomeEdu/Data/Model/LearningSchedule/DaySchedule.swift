//
//  DaySchedule.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/9/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class DaySchedule: Mappable {
    var weekday: Int?
    var subjects = [TimeSchedule]()
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        weekday <- map["weekday"]
        subjects <- map["subjects"]
    }
}
