//
//  ScoreData.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class ScoreData: Mappable {
    var id: String?
    var studentId: Double?
    var totalCredit: Int?
    var totalGpa: Double?
    var terms = [ScoreTerm]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        studentId <- map["student_id"]
        totalCredit <- map["total_credit"]
        totalGpa <- map["total_gpa"]
        terms <- map["terms"]
    }
}
