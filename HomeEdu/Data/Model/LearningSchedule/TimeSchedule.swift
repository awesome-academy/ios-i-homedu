//
//  TimeSchedule.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/9/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

struct TimeSchedule {
    var name = ""
    var id = ""
    var start = 0
    var end = 0
    var room = ""
}

extension TimeSchedule: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        start <- map["start"]
        end <- map["end"]
        room <- map["room"]
    }
}
