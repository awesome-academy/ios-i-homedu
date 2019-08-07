//
//  APIServices.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIServices {
    
    /// API to get exam schedule
    ///
    /// - Parameters:
    ///   - url: API url
    ///   - method: HTTP Method
    ///   - headers: HTTP Headers
    ///   - callback: post process after get data
    static func getExamSchedule(url: URLConvertible, method: HTTPMethod, headers: HTTPHeaders, callback: @escaping (ExamResponse) -> Void) {
        Alamofire.request(Urls.examScheduleUrl, method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<ExamResponse>) in
            guard let dataResponse = response.result.value else { return }
            callback(dataResponse)
        }
    }
}
