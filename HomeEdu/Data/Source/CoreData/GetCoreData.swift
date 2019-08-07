//
//  GetCoreData.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/7/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation

class GetCoreData {
    static let shared = GetCoreData()
    var infoStudentValue = [String]()
    var infoClassValue = [String]()
    var infoAddressValue = [String]()
    var token: String?
    var studentId: String?
    
    private init() {
    }
    
    func getTokenAndId() {
        do {
            if let fetchResult = try PersistenceService.context.fetch(Account.fetchRequest()) as? [Account] {
                print("TAGGGG: \(fetchResult[0].otherMail ?? "ALALALALA")")
                token = fetchResult[0].token ?? ""
                studentId = fetchResult[0].studentId ?? ""
            }
        } catch {
            print(error)
        }
    }
    
    func getInfoAccount() {
        do {
            if let fetchResult = try PersistenceService.context.fetch(Account.fetchRequest()) as? [Account] {
                print("TAGGGG: \(fetchResult[0].otherMail ?? "ALALALALA")")
                infoStudentValue.append(fetchResult[0].studentId ?? "")
                infoStudentValue.append(fetchResult[0].fullname ?? "")
                infoStudentValue.append(fetchResult[0].birthday ?? "")
                infoStudentValue.append(fetchResult[0].sex ?? "")
                infoStudentValue.append(fetchResult[0].vnuMail ?? "")
                infoStudentValue.append(fetchResult[0].otherMail ?? "")
                infoClassValue.append(fetchResult[0].programType ?? "")
                infoClassValue.append(fetchResult[0].classStudent ?? "")
                infoAddressValue.append(fetchResult[0].nation ?? "")
                infoAddressValue.append(fetchResult[0].address ?? "")
            }
        } catch {
            print(error)
        }
    }
}
