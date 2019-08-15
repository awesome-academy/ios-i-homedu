//
//  StudentRepository.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/15/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation

class StudentRepository : LocalProtocol{    
    var local: LocalProtocol?
    
    init(local: LocalProtocol) {
        self.local = local
    }
    
    func getStudentId() -> String {
        guard let studentLocal = local else { return "" }
        return studentLocal.getStudentId()
    }
    
    func getToken() -> String {
        guard let studentLocal = local else { return "" }
        return studentLocal.getStudentId()
    }
}
