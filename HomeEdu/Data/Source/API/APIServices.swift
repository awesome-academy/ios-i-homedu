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

final class APIServices {
    static let reachabilityManager = NetworkReachabilityManager()
    static let studentRepository = StudentRepository(local: StudentLocalDataSource())
    
    /// API to get information
    ///
    /// - Parameters:
    ///   - url: API url
    ///   - method: HTTP Method
    ///   - headers: HTTP Headers
    ///   - callback: post process after get data
    static func getInformation<T: Mappable>(url: URLConvertible, callback: @escaping (T) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": studentRepository.getToken()
        ]
        Alamofire.request(url, method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<T>) in
            guard let dataResponse = response.result.value else { return }
            callback(dataResponse)
        }
    }
    
    static func putEditInfo(_ param: Parameters,
                  completion callback: @escaping (Bool, Bool) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": studentRepository.getToken()
        ]
        Alamofire.request(Urls.urlEditInfoStudent,
                          method: .put,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: headers)
            .responseObject { (response: DataResponse<InfoEditResponse>) in
                reachabilityManager?.startListening()
                reachabilityManager?.listener = { _ in
                    if let isNetworkReachable = reachabilityManager?.isReachable,
                        isNetworkReachable == true {
                        print("isNetworkReachable: \(isNetworkReachable)")
                        let infoStudentResponse = response.result.value
                        if let success = infoStudentResponse?.success {
                            callback(true, success)
                        }
                    } else {
                        callback(false, false)
                    }
                }
        }
    }
}
