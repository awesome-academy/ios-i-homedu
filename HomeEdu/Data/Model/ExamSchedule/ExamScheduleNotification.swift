//
//  ExamScheduleNotification.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class ExamScheduleNotification {
    
    /// Setup local notification by subject schedule
    ///
    /// - Parameter schedule: list subject schedule
    static func setupNotification(schedule: [SubjectSchedule]) {
        let center = UNUserNotificationCenter.current()
        
        for subject in schedule {
            UIViewController.showNotificationBySchedule(center: center, subjectSchedule: subject)
        }
    }
}
