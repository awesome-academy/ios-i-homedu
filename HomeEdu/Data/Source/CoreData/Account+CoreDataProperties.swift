//
//  Account+CoreDataProperties.swift
//  
//
//  Created by Nguyen Cuong on 8/7/19.
//
//

import Foundation
import CoreData

extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var address: String?
    @NSManaged public var birthday: String?
    @NSManaged public var classStudent: String?
    @NSManaged public var fullname: String?
    @NSManaged public var nation: String?
    @NSManaged public var otherMail: String?
    @NSManaged public var programType: String?
    @NSManaged public var sex: String?
    @NSManaged public var studentId: String?
    @NSManaged public var token: String?
    @NSManaged public var vnuMail: String?
}
