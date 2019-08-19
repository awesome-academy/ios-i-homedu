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
        return "admin"
    }
    
    func getToken() -> String {
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWNjZXNzIjp0cnVlLCJtZXNzYWdlIjoiTG9hZGVkIGFjY291bnQiLCJkYXRhIjpbeyJfaWQiOiI1ZDQyYjUwYTIxZWFlMDM0ZGM2YWJjMzciLCJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIkMmEkMTAkdnVDRnBGWHBJc01UQ01VdnpOTXlNT1JpcEYxNjZxQTIwcUhiYzlueThMTUlRWXpGTTJRbHkiLCJzdHVkZW50X2lkIjoiYWRtaW4iLCJiaXJ0aGRheSI6IjE5OTgtMDMtMDEiLCJzZXgiOiJOYW0iLCJmdWxsbmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkB2bnUuZWR1LnZuIiwib3RoZXJfZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJwcm9ncmFtX3R5cGUiOiJD4butIG5ow6JuIiwiY2xhc3MiOiJRSC0yMDE2LWkvQ1EtQy1BLUNMQzIiLCJuYXRpb24iOiJWaeG7h3QgTmFtIiwiYWRkcmVzcyI6IlRQLiBIw6AgTuG7mWkifV0sImlhdCI6MTU2NjE5NTU1Nn0.eTmYf7qVN7TP4bLHO50ZYuMLHUaV12js621DtYrnLr4"
    }
}
