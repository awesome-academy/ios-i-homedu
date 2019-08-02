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

class AccountRepository {

    static let shared = AccountRepository()
    
    private init() {
    }
    
    func login(_ param: Parameters,
               completion callback: @escaping (Bool) -> Void) {
        Alamofire.request(Urls.urlLogin,
                          method: .post,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: [:]).responseObject { (response: DataResponse<InfoResponse>) in
                            let infoStudentResponse = response.result.value
                            if let success = infoStudentResponse?.success {
                                callback(success)
                            }
        }
    }
}
