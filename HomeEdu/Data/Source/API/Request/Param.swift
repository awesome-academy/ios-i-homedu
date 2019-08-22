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
    static func paramEditInfo(fullname: String,
                       birthday: String,
                       sex: String,
                       otherMail: String,
                       nation: String,
                       address: String) -> Parameters {
        let paramInfoChange: Parameters = [
            "fullname": fullname,
            "birthday": birthday,
            "sex": sex,
            "other_email": otherMail,
            "nation": nation,
            "address": address
        ]
        return paramInfoChange
    }
}
