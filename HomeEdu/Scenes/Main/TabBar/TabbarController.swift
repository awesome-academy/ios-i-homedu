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
            "Authorization": Constant.authorizationToken
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
