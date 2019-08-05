//
//  LoginRequest.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class AccountRequest {

    static let shared = AccountRequest()
    let reachabilityManager = NetworkReachabilityManager()
    private init() {
    }
    
    func login(_ param: Parameters,
               completion callback: @escaping (Bool,Bool) -> Void) {
        Alamofire.request(Urls.urlLogin,
                          method: .post,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: [:]).responseObject { (response: DataResponse<InfoResponse>) in
                            self.reachabilityManager?.startListening()
                            self.reachabilityManager?.listener = { _ in
                                var statusInternet = false
                                if let isNetworkReachable = self.reachabilityManager?.isReachable,
                                    isNetworkReachable == true {
                                    statusInternet = true
                                    let infoStudentResponse = response.result.value
                                    if let success = infoStudentResponse?.success {
                                        callback(success, statusInternet)
                                    }
                                } else {
                                    callback(false, statusInternet)
                                }
                            }
        }
    }
}
