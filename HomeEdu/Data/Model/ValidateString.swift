//
//  String+.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit

extension String {
    enum ValidateType {
        case username
        case password
    }
    
    func isValid(_ validType: ValidateType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .username:
//          Usernames can consist of lowercase and capitals
//          Usernames can consist of alphanumeric characters
//          Usernames can consist of underscore and hyphens and spaces
//          Cannot be two underscores, two hypens or two spaces in a row
//          Cannot have a underscore, hypen or space at the start or end
            regex = "/^[a-zA-Z0-9]+([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*[a-zA-Z0-9]+$/"
        case .password:
//          Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase
            regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
