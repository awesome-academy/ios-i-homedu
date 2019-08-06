//
//  String+.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/5/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation

extension String {
    enum validateType {
        case username
        case password
    }
    
    /// Check input in textfield
    ///
    /// - Parameter validType: type of input
    /// - Returns: True: Input valid, False: Input invalid
    func isValidInput(_ validType: validateType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .username:
            //          Usernames can consist of lowercase and capitals
            //          Usernames can consist of alphanumeric characters
            //          Usernames can consist of underscore and hyphens and spaces
            //          Cannot be two underscores, two hypens or two spaces in a row
            //          Cannot have a underscore, hypen or space at the start or end
            regex = "^[a-zA-Z0-9]+(?:[_-]?[a-zA-Z0-9])*$"
        case .password:
            //          Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase
            regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
    
    /// Convert string to integer number
    ///
    /// - Returns: integer number of string input
    func toInt() -> Int {
        return Int(self) ?? 0
    }
}
