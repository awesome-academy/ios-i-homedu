//
//  LoginRequest.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/1/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class AccountRequest {

    static let shared = AccountRequest()
    private init() {
    }
    
    func login(_ param: Parameters,
               completion callback: @escaping (Bool, Bool, InfoResponse) -> Void) {
        Alamofire.request(Urls.urlLogin,
                          method: .post,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: [:])
            .responseObject { (response: DataResponse<InfoResponse>) in
                    guard let dataResponse = response.result.value else { return }
                    if InternetConnectivity.isConnectedToInternet() {
                        let infoStudentResponse = response.result.value
                        if let success = infoStudentResponse?.success {
                            callback(true, success, dataResponse)
                        }
                    } else {
                        callback(false, false, dataResponse)
                    }
        }
    }
}
