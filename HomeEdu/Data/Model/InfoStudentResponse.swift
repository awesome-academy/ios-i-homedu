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
        token <- map[DataJSON.token]
        success <- map[DataJSON.success]
        infoStudent <- map[DataJSON.data]
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
        fullName <- map[DataJSON.fullname]
        studentId <- map[DataJSON.studentId]
        sex <- map[DataJSON.sex]
        birthday <- map[DataJSON.birthday]
        vnuMail <- map[DataJSON.email]
        otherMail <- map[DataJSON.otherMail]
//        SaveInfoStudent.infoStudent += [fullName,
//                                        studentId,
//                                        sex,
//                                        birthday,
//                                        vnuMail,
//                                        otherMail]
        
        programType <- map[DataJSON.programType]
        classStudent <- map[DataJSON.classStudent]
//        SaveInfoStudent.infoClass += [programType, classStudent]
        
        nation <- map[DataJSON.nation]
        address <- map[DataJSON.address]
//        SaveInfoStudent.infoAdress += [nation, address]
    }
}
