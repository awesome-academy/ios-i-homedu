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
                socket.on(clientEvent: .connect) { _, _ in
                    let params = [
                        "student_id": Constant.studentId
                    ]
                    socket.emit(Constant.emitWho, params)
                }
                socket.on(Constant.grade) { data, _ in
                    if (!data.isEmpty) {
                        guard let socketMessage = data[0] as? NSDictionary else { return }
                        guard let message = socketMessage["msg"] as? String else { return }
                        UIViewController.showNotification(center: center, msg: message)
                    } else {
                        print(Constant.dataErr)
                    }
                }
                socket.on(Constant.schedule) { data, _ in
                    if (!data.isEmpty) {
                        guard let socketMessage = data[0] as? NSDictionary else { return }
                        guard let message = socketMessage["msg"] as? String else { return }
                        UIViewController.showNotification(center: center, msg: message)
                    } else {
                        print(Constant.dataErr)
                    }
                }
                socket.on(Constant.exam) { data, _ in
                    if (!data.isEmpty) {
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
