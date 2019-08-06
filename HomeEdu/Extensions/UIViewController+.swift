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
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(Constant.Alert.alertOK, comment: ""),
                                      style: UIAlertAction.Style.default) { (action) in
                                        alert.dismiss(animated: true, completion: nil)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
