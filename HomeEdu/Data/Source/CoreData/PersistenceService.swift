//
//  PersistenceService.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/7/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import CoreData

class PersistenceService {
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataHomeEdu")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static func saveInfoAccount(token: String,
                                fullname: String,
                                studentId: String,
                                sex: String,
                                birthday: String,
                                vnuMail: String,
                                otherMail: String,
                                programType: String,
                                classStudent: String,
                                nation: String,
                                address: String) {
        let infoAccount = Account(context: PersistenceService.context)
        infoAccount.token = token
        infoAccount.fullname = fullname
        infoAccount.studentId = studentId
        infoAccount.sex = sex
        infoAccount.birthday = birthday
        infoAccount.vnuMail = vnuMail
        infoAccount.otherMail = otherMail
        infoAccount.programType = programType
        infoAccount.classStudent = classStudent
        infoAccount.nation = nation
        infoAccount.address = address
        PersistenceService.saveContext()
    }
}
