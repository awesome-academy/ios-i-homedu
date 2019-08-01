//
//  Constant.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

enum Constant {
    //Tabbar
    static let accountId = "Account"
    static let examScheduleId = "ExamSchedule"
    static let scheduleId = "Schedule"
    static let viewScoreId = "ViewScore"
    static let aboutId = "About"
    
    static let accountTitle = "Tài khoản"
    static let examScheduleTitle = "Lịch thi"
    static let scheduleTitle = "TKB"
    static let viewScoreTitle = "Xem điểm"
    static let aboutTitle = "About"

    //Socket
    static let socketTitle = "Message from Homedu"
    
    //Emit Event
    static let emitWho = "who"
    
    //Listen Event
    static let grade = "new_grade"
    static let schedule = "new_schedule"
    static let exam = "new_examschedule"
    
    //Errors
    static let dataErr = "Data don't have any items"
}
