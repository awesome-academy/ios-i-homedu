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

class LoginReqest {

    static let shared = LoginReqest()
    
    private init() {
    }
    
    func loginRequestFromApi(_ param: Parameters,
                             completion callback: @escaping (Bool) -> Void) {
        Alamofire.request(URLs.urlLogin, method: .post,
                          parameters: param, encoding: JSONEncoding.default,
                          headers: [:]).responseObject { (response: DataResponse<InfoStudentResponse>) in
                            let infoStudentResponse = response.result.value
                            callback(infoStudentResponse!.success)
        }
    }
}
