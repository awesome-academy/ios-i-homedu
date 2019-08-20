//
//  InfoAccount.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class InfoAccount: Mappable {
    var fullName = ""
    var studentId = ""
    var birthday = ""
    var sex = ""
    var vnuMail = ""
    var otherMail = ""
    var programType = ""
    var classStudent = ""
    var nation = ""
    var address = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        fullName <- map["fullname"]
        studentId <- map["student_id"]
        sex <- map["sex"]
        birthday <- map["birthday"]
        vnuMail <- map["email"]
        otherMail <- map["other_email"]
        programType <- map["program_type"]
        classStudent <- map["class"]
        nation <- map["nation"]
        address <- map["address"]
    }
}
