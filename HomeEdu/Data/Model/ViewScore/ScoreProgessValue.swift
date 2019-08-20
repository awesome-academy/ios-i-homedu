//
//  ScoreProgressValue.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/15/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class ScoreProgressValue: Mappable {
    var title: String?
    var behaviour: Int?
    var gradeTermScore: Double?
    var totalScore: Double?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        behaviour <- map["behaviour"]
        gradeTermScore <- map["grade_term"]
        totalScore <- map["total"]
    }
}
