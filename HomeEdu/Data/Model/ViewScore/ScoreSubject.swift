//
//  ScoreSubject.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class ScoreSubject: Mappable {
    var midtermScore: Double?
    var totalScore: Double?
    var finalScore: Double?
    var credit: Int?
    var gpa: Double?
    var id: String?
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        midtermScore <- map["midterm"]
        totalScore <- map["total"]
        finalScore <- map["final"]
        credit <- map["credit"]
        gpa <- map["GPA"]
        id <- map["id"]
        name <- map["name"]
    }
}
