//
//  ScoreProgress.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/15/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class ScoreProgress: Mappable {
    var studentId: String?
    var terms = [ScoreProgressValue]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        studentId <- map["student_id"]
        terms <- map["terms"]
    }
}
