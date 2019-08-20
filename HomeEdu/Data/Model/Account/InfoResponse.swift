//
//  InfoStudentResponse.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class InfoResponse: Mappable {
    var token = ""
    var success = false
    var studentId = ""
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        success <- map["success"]
        studentId <- map["student_id"]
    }
}
