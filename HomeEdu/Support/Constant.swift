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
    
    //Tabbar Title
    enum TitleTabBar {
        static let accountTitle = "common.account.title"
        static let examScheduleTitle = "common.examSchedule.title"
        static let scheduleTitle = "common.schedule.title"
        static let viewScoreTitle = "common.viewScore.title"
        static let aboutTitle = "common.about.title"
    }
    
    //Alert
    enum Alert {
        static let alertOK = "common.ok.alert"
        static let alertTitle = "common.title.alert"
        static let alertLoginFail = "common.loginFail.alert"
        static let usernameError = "common.usernameError.alert"
        static let passwordError = "common.passwordError.alert"
        static let userAndPassError = "common.userPassError.alert"
        static let internetError = "common.internetError.alert"
    }
    
    //About HomeEdu
    enum AboutHomedu {
        static let version = "common.version.aboutHomedu"
        static let contact = "common.contact.aboutHomedu"
        static let author = "common.author.aboutHomedu"
    }
    
    //WeekDay
    enum WeekDay: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }
    
    //Socket
    static let socketTitle = "Message from Homedu"
    
    //Emit Event
    static let emitWho = "who"
    
    //Listen Event
    static let grade = "new_grade"
    static let schedule = "new_schedule"
    static let exam = "new_examschedule"
    
    //General Information
    #if Staging
        static let studentId = "16022411"
        static let authorizationToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWNjZXNzIjp0cnVlLCJtZXNzYWdlIjoiTG9hZGVkIGFjY291bnQiLCJkYXRhIjpbeyJfaWQiOiI1ZDQyYjUwYTIxZWFlMDM0ZGM2YWJjMzciLCJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIkMmEkMTAkdnVDRnBGWHBJc01UQ01VdnpOTXlNT1JpcEYxNjZxQTIwcUhiYzlueThMTUlRWXpGTTJRbHkiLCJzdHVkZW50X2lkIjoiYWRtaW4iLCJiaXJ0aGRheSI6IjE5OTgtMDMtMDEiLCJzZXgiOiJOYW0iLCJmdWxsbmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkB2bnUuZWR1LnZuIiwib3RoZXJfZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwcm9ncmFtX3R5cGUiOiJD4butIG5ow6JuIiwiY2xhc3MiOiJRSC0yMDE2LWkvQ1EtQy1BLUNMQzIiLCJuYXRpb24iOiJWaeG7h3QgTmFtIiwiYWRkcmVzcyI6IlRQLiBIw6AgTuG7mWkifV0sImlhdCI6MTU2NDk3Njk1N30.ZofUzu94ynk3AEQsbQ-jyDwRyHXG4doQGzrSC4J5pFE"
    #elseif Production
        static let studentId = "admin"
        static let authorizationToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWNjZXNzIjp0cnVlLCJtZXNzYWdlIjoiTG9hZGVkIGFjY291bnQiLCJkYXRhIjpbeyJfaWQiOiI1ZDQyYjUwYTIxZWFlMDM0ZGM2YWJjMzciLCJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIkMmEkMTAkdnVDRnBGWHBJc01UQ01VdnpOTXlNT1JpcEYxNjZxQTIwcUhiYzlueThMTUlRWXpGTTJRbHkiLCJzdHVkZW50X2lkIjoiYWRtaW4iLCJiaXJ0aGRheSI6IjE5OTgtMDMtMDEiLCJzZXgiOiJOYW0iLCJmdWxsbmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkB2bnUuZWR1LnZuIiwib3RoZXJfZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwcm9ncmFtX3R5cGUiOiJD4butIG5ow6JuIiwiY2xhc3MiOiJRSC0yMDE2LWkvQ1EtQy1BLUNMQzIiLCJuYXRpb24iOiJWaeG7h3QgTmFtIiwiYWRkcmVzcyI6IlRQLiBIw6AgTuG7mWkifV0sImlhdCI6MTU2NDk3Njk1N30.ZofUzu94ynk3AEQsbQ-jyDwRyHXG4doQGzrSC4J5pFE"
    #elseif Release
        static let studentId = "admin"
        static let authorizationToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWNjZXNzIjp0cnVlLCJtZXNzYWdlIjoiTG9hZGVkIGFjY291bnQiLCJkYXRhIjpbeyJfaWQiOiI1ZDQyYjUwYTIxZWFlMDM0ZGM2YWJjMzciLCJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIkMmEkMTAkdnVDRnBGWHBJc01UQ01VdnpOTXlNT1JpcEYxNjZxQTIwcUhiYzlueThMTUlRWXpGTTJRbHkiLCJzdHVkZW50X2lkIjoiYWRtaW4iLCJiaXJ0aGRheSI6IjE5OTgtMDMtMDEiLCJzZXgiOiJOYW0iLCJmdWxsbmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkB2bnUuZWR1LnZuIiwib3RoZXJfZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwcm9ncmFtX3R5cGUiOiJD4butIG5ow6JuIiwiY2xhc3MiOiJRSC0yMDE2LWkvQ1EtQy1BLUNMQzIiLCJuYXRpb24iOiJWaeG7h3QgTmFtIiwiYWRkcmVzcyI6IlRQLiBIw6AgTuG7mWkifV0sImlhdCI6MTU2NDk3Njk1N30.ZofUzu94ynk3AEQsbQ-jyDwRyHXG4doQGzrSC4J5pFE"
    #endif
    
    //Errors
    static let dataErr = "Data don't have any items"
    
    //TableView
    static let reloadTitle = "Reloading..."
}
