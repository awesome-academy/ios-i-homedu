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
        return Constant.studentId
    }
    
    func getToken() -> String {
        return Constant.authorizationToken
    }
}
