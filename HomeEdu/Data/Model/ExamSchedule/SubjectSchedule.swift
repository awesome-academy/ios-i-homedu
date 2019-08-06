//
//  SubjectSchedule.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

struct SubjectSchedule {
    var name = ""
    var date = ""
    var start = 0
    var room = ""
    var id = 0
}

extension SubjectSchedule: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        date <- map["date"]
        start <- map["start"]
        room <- map["room"]
        id <- map["id"]
    }
}
