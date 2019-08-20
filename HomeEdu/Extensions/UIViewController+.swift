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
import SAProgressHUB

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
    
    /// Show Notification using Local Notification at specific time
    ///
    /// - Parameters:
    ///   - center: UNUserNotificationCenter
    ///   - subjectSchedule: Schedule for a subject
    static func showNotificationBySchedule(center: UNUserNotificationCenter, subjectSchedule: SubjectSchedule) {
        // Get shedule raw value
        let name = subjectSchedule.name
        let id = subjectSchedule.id
        let room = subjectSchedule.room
        let date = subjectSchedule.date
        let start = subjectSchedule.start
        
        // Get standard value
        let dateParser = Date().parse("\(date) \(start):00:00")
        let message = getMessage(name: name, id: id, room: room, start: start)
        
        // Set content for the notification
        let content = UNMutableNotificationContent()
        content.title = Constant.socketTitle
        content.body = message
        content.sound = UNNotificationSound.default
        
        // Set schedule before 1 hour to show the notification
        guard let beforeAHour = Calendar.current.date(byAdding: .hour, value: -1, to: dateParser) else { return }
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: beforeAHour)
        
        // Request to show the notification
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: Constant.socketTitle, content: content, trigger: trigger)
        center.add(request) { (error) in
            print(error)
        }
    }
    
    /// Get message content to show the notification
    ///
    /// - Parameters:
    ///   - name: Subject name information
    ///   - id: student id information
    ///   - room: room information
    ///   - start: start time information
    /// - Returns: message
    static func getMessage(name: String, id: Int, room: String, start: Int) -> String {
        let message = """
        Sắp tới có môn thi
        Môn: \(name)
        Phòng: \(room)
        Giờ bắt đầu: \(start)h
        Số báo danh: \(id)
        """
        return message
    }
    
    
    /// Show progress loading data
    ///
    /// - Parameter hub: input progress hub
    func showIndicator(hub: SAProgressHUB) {
        hub.show(in: self.view, title: "Coming...", isUserInteractionEnabled: true)
    }
    
    
    /// Hide progress loading data
    ///
    /// - Parameter hub: input progress hub
    func hideIndicator(hub: SAProgressHUB) {
        hub.dismiss(in: self.view)
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(Constant.Alert.alertOK, comment: ""),
                                      style: UIAlertAction.Style.default) { (_) in
                                        alert.dismiss(animated: true, completion: nil)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
