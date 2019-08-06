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

final class HomeduSocket {
    
    static let shared = HomeduSocket()
    var socketManager: SocketManager?
    
    init() {
        configSocket()
    }
    
    /// Config HomeduSocket to listen event from server
    func configSocket() {
        if let url = URL(string: Urls.socketUrl) {
            socketManager = SocketManager(socketURL: url, config: [.log(true), .compress])
            if let manager = socketManager {
                let socket = manager.defaultSocket
                let center = UNUserNotificationCenter.current()
                socket.on(clientEvent: .connect) { data, ack in
                    let params = [
                        "student_id": "16022411"
                    ]
                    socket.emit(Constant.emitWho, params)
                }
                socket.on(Constant.grade) { data, ack in
                    if (data.count > 0) {
                        guard let socketMessage = data[0] as? NSDictionary else { return }
                        guard let message = socketMessage["msg"] as? String else { return }
                        UIViewController.showNotification(center: center, msg: message)
                    } else {
                        print(Constant.dataErr)
                    }
                }
                socket.on(Constant.schedule) { data, ack in
                    if (data.count > 0) {
                        guard let socketMessage = data[0] as? NSDictionary else { return }
                        guard let message = socketMessage["msg"] as? String else { return }
                        UIViewController.showNotification(center: center, msg: message)
                    } else {
                        print(Constant.dataErr)
                    }
                }
                socket.on(Constant.exam) { data, ack in
                    if (data.count > 0) {
                        guard let socketMessage = data[0] as? NSDictionary else { return }
                        guard let message = socketMessage["msg"] as? String else { return }
                        UIViewController.showNotification(center: center, msg: message)
                    } else {
                        print(Constant.dataErr)
                    }
                }
                socket.connect()
            }
        }
    }
}

