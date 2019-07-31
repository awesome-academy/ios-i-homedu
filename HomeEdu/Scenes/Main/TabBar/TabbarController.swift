//
//  TabbarController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/30/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    var homeduSocket: HomeduSocket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeduSocket = HomeduSocket.shared
        setupTabbar()
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
        
        viewScoreController.tabBarItem = UITabBarItem(title: Constant.viewScoreTitle, image: nil, tag: 0)
        scheduleController.tabBarItem = UITabBarItem(title: Constant.scheduleTitle, image: nil, tag: 1)
        accountController.tabBarItem = UITabBarItem(title: Constant.accountTitle, image: nil, tag: 2)
        examScheduleController.tabBarItem = UITabBarItem(title: Constant.examScheduleTitle, image: nil, tag: 3)
        aboutController.tabBarItem = UITabBarItem(title: Constant.aboutTitle, image: nil, tag: 4)
        self.viewControllers = [viewScoreController, scheduleController, accountController, examScheduleController, aboutController]
    }
}
