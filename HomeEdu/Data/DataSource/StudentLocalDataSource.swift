//
//  StudentLocalDataSource.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/15/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation

class StudentLocalDataSource: LocalProtocol {
    func getStudentId() -> String {
        let studentId = UserDefaults.standard.string(forKey: "StudentID") ?? ""
        return studentId
    }
    
    func getToken() -> String {
        var token = "Bearer "
        token += UserDefaults.standard.string(forKey: "Authorization") ?? ""
        return token
    }
}
