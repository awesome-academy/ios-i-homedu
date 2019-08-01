//
//  UIViewController+.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

extension UIViewController {    
    /// Show Notification using Local Notification
    ///
    /// - Parameters:
    ///   - center: UNUserNotificationCenter
    ///   - msg: message to show
    static func showNotification(center: UNUserNotificationCenter, msg: String) {
        let content = UNMutableNotificationContent()
        content.title = Constant.socketTitle
        content.body = msg
        content.sound = UNNotificationSound.default
        let date = Date(timeIntervalSinceNow: 5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: Constant.socketTitle, content: content, trigger: trigger)
        center.add(request) { (error) in
            print(error)
        }
    }
}
