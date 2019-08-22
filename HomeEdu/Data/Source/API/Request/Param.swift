//
//  Param.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/22/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import Alamofire

final class Param {
    private var fullname: String?
    private var birthday: String?
    private var sex: String?
    private var otherMail: String?
    private var nation: String?
    private var address: String?
        
    init(fullname: String,
         birthday: String,
         sex: String,
         otherMail: String,
         nation: String,
         address: String) {
        self.fullname = fullname
        self.birthday = birthday
        self.sex = sex
        self.otherMail = otherMail
        self.nation = nation
        self.address = address
    }
    
    func exportToParameters() -> Parameters {
        let paras: Parameters = [
            "fullname": fullname,
            "birthday": birthday,
            "sex": sex,
            "other_email": otherMail,
            "nation": nation,
            "address": address
        ]
        return paras
    }
}
