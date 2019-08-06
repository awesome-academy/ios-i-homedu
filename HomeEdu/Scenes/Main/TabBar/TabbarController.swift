//
//  TabbarController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/30/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Reusable
import Alamofire

class TabbarController: UITabBarController {
    
    let homeduSocket = HomeduSocket.shared
    var subjectSchedules = [SubjectSchedule]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        setupTabbar()
        setupNotification()
    }
    
    /// Setup local notification for exam schedule
    func setupNotification() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWNjZXNzIjp0cnVlLCJtZXNzYWdlIjoiTG9hZGVkIGFjY291bnQiLCJkYXRhIjpbeyJfaWQiOiI1ZDQyYjUwYTIxZWFlMDM0ZGM2YWJjMzciLCJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIkMmEkMTAkdnVDRnBGWHBJc01UQ01VdnpOTXlNT1JpcEYxNjZxQTIwcUhiYzlueThMTUlRWXpGTTJRbHkiLCJzdHVkZW50X2lkIjoiYWRtaW4iLCJiaXJ0aGRheSI6IjE5OTgtMDMtMDEiLCJzZXgiOiJOYW0iLCJmdWxsbmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkB2bnUuZWR1LnZuIiwib3RoZXJfZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwcm9ncmFtX3R5cGUiOiJD4butIG5ow6JuIiwiY2xhc3MiOiJRSC0yMDE2LWkvQ1EtQy1BLUNMQzIiLCJuYXRpb24iOiJWaeG7h3QgTmFtIiwiYWRkcmVzcyI6IlRQLiBIw6AgTuG7mWkifV0sImlhdCI6MTU2NDk3Njk1N30.ZofUzu94ynk3AEQsbQ-jyDwRyHXG4doQGzrSC4J5pFE"
        ]
        APIServices.getExamSchedule(url: Urls.examScheduleUrl, method: .post, headers: headers) { (response) in
            guard let data = response.data, !data.isEmpty else { return }
            if (data.count > 0) {
                guard let examSchedules = data[0].examSchedule else { return }
                for subject in examSchedules {
                    self.subjectSchedules.append(subject)
                }
                ExamScheduleNotification.setupNotification(schedule: self.subjectSchedules)
            }
        }
    }

    func setupTabbar() {
        let account = Storyboards.account
        let examSchedule = Storyboards.examSchedule
        let schedule = Storyboards.schedule
        let viewScore = Storyboards.viewScore
        let about = Storyboards.about
        
        let accountController = account.instantiateViewController(withIdentifier: Constant.accountId)
        let examScheduleController = examSchedule.instantiateViewController(withIdentifier: Constant.examScheduleId)
        let scheduleController = schedule.instantiateViewController(withIdentifier: Constant.scheduleId)
        let viewScoreController = viewScore.instantiateViewController(withIdentifier: Constant.viewScoreId)
        let aboutController = about.instantiateViewController(withIdentifier: Constant.aboutId)
        
        viewScoreController.tabBarItem = UITabBarItem(title: NSLocalizedString(Constant.TitleTabBar.viewScoreTitle, comment: ""),
                                                      image: nil, tag: 0)
        scheduleController.tabBarItem = UITabBarItem(title: NSLocalizedString(Constant.TitleTabBar.scheduleTitle, comment: ""),
                                                     image: nil, tag: 1)
        accountController.tabBarItem = UITabBarItem(title: NSLocalizedString(Constant.TitleTabBar.accountTitle, comment: ""),
                                                    image: nil, tag: 2)
        examScheduleController.tabBarItem = UITabBarItem(title: NSLocalizedString(Constant.TitleTabBar.examScheduleTitle, comment: ""),
                                                         image: nil, tag: 3)
        aboutController.tabBarItem = UITabBarItem(title: NSLocalizedString(Constant.TitleTabBar.aboutTitle, comment: ""),
                                                  image: nil, tag: 4)
        self.viewControllers = [viewScoreController, scheduleController, accountController, examScheduleController, aboutController]
    }
}

extension TabbarController: StoryboardSceneBased {
    static let sceneStoryboard = Storyboards.tabBar
}
