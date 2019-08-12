//
//  APIServices.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class APIServices {
    
    /// API to get exam schedule
    ///
    /// - Parameters:
    ///   - url: API url
    ///   - method: HTTP Method
    ///   - headers: HTTP Headers
    ///   - callback: post process after get data
    static func getInformation<T: Mappable>(url: URLConvertible, callback: @escaping (T) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWNjZXNzIjp0cnVlLCJtZXNzYWdlIjoiTG9hZGVkIGFjY291bnQiLCJkYXRhIjpbeyJfaWQiOiI1ZDQyYjUyYTJmY2M5MjM1MDc2OWJjMjkiLCJ1c2VybmFtZSI6IjE2MDIyNDExIiwicGFzc3dvcmQiOiIkMmEkMTAkMERIMXBtN0V5N1dPOVkxdmJ6Y0s4ZWVITlhtdDZqamZtOTBkR2h3amFBMFBYY2l5cU1rbXUiLCJzdHVkZW50X2lkIjoiMTYwMjI0MTEiLCJiaXJ0aGRheSI6IjE5OTgtMDMtMDEiLCJzZXgiOiJOYW0iLCJmdWxsbmFtZSI6IlBow60gVsSDbiBNaW5oIiwiZW1haWwiOiIxNjAyMjQxMUB2bnUuZWR1LnZuIiwib3RoZXJfZW1haWwiOiJwaGl2YW5taW5oMTBAZ21haWwuY29tIiwicHJvZ3JhbV90eXBlIjoiQ-G7rSBuaMOibiIsImNsYXNzIjoiUUgtMjAxNi1pL0NRLUMtQS1DTEMyIiwibmF0aW9uIjoiVmnhu4d0IE5hbSIsImFkZHJlc3MiOiJUUC4gSMOgIE7hu5lpIn1dLCJpYXQiOjE1NjUzMzk3OTl9.JQ8ZucYfiK4P_HfeIlw9hxoAUfRpZf3oSIhW5uufp4g"
        ]
        Alamofire.request(url, method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<T>) in
            guard let dataResponse = response.result.value else { return }
            callback(dataResponse)
        }
    }
}
