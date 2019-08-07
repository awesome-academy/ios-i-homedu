//
//  Date+.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/6/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation

extension Date {
    /// Parse date string to Date
    ///
    /// - Parameters:
    ///   - string: string date format
    ///   - format: format of Date
    /// - Returns: Date parse from string
    func parse(_ string: String, format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: string) else { return Date() }
        return date
    }
}
