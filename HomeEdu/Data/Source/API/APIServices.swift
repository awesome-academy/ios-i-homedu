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
            "Authorization": Constant.authorizationToken
        ]
        Alamofire.request(url, method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<T>) in
            guard let dataResponse = response.result.value else { return }
            callback(dataResponse)
        }
    }
}
