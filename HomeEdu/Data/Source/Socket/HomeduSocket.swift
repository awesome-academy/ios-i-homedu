//
//  HomeduSocket.swift
//  HomeEdu
//
//  Created by Minh Mon on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import SocketIO
import UserNotifications

class HomeduSocket {
    
    static let shared = HomeduSocket()
    
    let manager = SocketManager(socketURL: URL(string: "http://homedu.herokuapp.com")!, config: [.log(true), .compress])
    
    /// Config HomeduSocket to listen event from server
    func configSocket() {
        let socket = manager.defaultSocket
        
        let center = UNUserNotificationCenter.current()
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
            
            let params = [
                "student_id": SaveData.masinhvien
            ]
            socket.emit("who", params)
        }
        
        socket.on("new_grade") {data, ack in
            
            if let res = data[0] as? NSDictionary{
                self.showNotification(center: center, msg: res["msg"] as! String)
            }
        }
        
        socket.on("new_schedule") {data, ack in
            
            if let res = data[0] as? NSDictionary{
                self.showNotification(center: center, msg: res["msg"] as! String)
            }
        }
        
        socket.on("new_examschedule") {data, ack in
            
            if let res = data[0] as? NSDictionary{
                self.showNotification(center: center, msg: res["msg"] as! String)
            }
        }
        
        socket.connect()
    }
    
    /// Show Notification using Local Notification
    ///
    /// - Parameters:
    ///   - center: UNUserNotificationCenter
    ///   - msg: message to show
    func showNotification(center: UNUserNotificationCenter, msg: String) {
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = msg
        content.sound = UNNotificationSound.default
        content.threadIdentifier = "local-notifications temp"
        
        let date = Date(timeIntervalSinceNow: 5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Message", content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { (error) in
            if let err = error {
                print(err)
            }
        })
    }
    
}
