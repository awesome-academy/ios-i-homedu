//
//  InfoStudentResponse.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class InfoStudentResponse: Mappable {
    
    var token = ""
    var success = false
    var infoStudent = [InfoStudent]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        success <- map["success"]
        infoStudent <- map["data"]
    }
}

class InfoStudent: Mappable {

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
        otherMail <- map["other_mail"]
        InfoOfStudent.infoStudent += [fullName,
                                        studentId,
                                        sex,
                                        birthday,
                                        vnuMail,
                                        otherMail]
        
        programType <- map["program_type"]
        classStudent <- map["class"]
        InfoOfStudent.infoClass += [programType, classStudent]
        
        nation <- map["nation"]
        address <- map["address"]
        InfoOfStudent.infoAdress += [nation, address]
    }
}
