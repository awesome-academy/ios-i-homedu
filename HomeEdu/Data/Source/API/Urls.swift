//
//  URLs.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

enum Urls {
    private static let endPoint = "https://homedu.herokuapp.com"
    static let urlLogin = endPoint + "/api/login"
    static let urlViewScoreProgess = endPoint + "/api/grade"
    static let urlViewScore = endPoint + "/api/points"
    static let urlInfoStudent = endPoint + "/api/userinfor"
    static let socketUrl = endPoint
    static let examScheduleUrl = endPoint + "/api/exam"
    static let learningScheduleUrl = endPoint + "/api/schedule"
}
