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
                                    if let infoStudentResponse = response.result.value {
                                        let infoStudent = infoStudentResponse.infoStudent
                                        if !infoStudent.isEmpty {
                                            PersistenceService.saveInfoAccount(token: infoStudentResponse.token,
                                                                               fullname: infoStudent[0].fullName,
                                                                               studentId: infoStudent[0].studentId,
                                                                               sex: infoStudent[0].sex,
                                                                               birthday: infoStudent[0].birthday,
                                                                               vnuMail: infoStudent[0].vnuMail,
                                                                               otherMail: infoStudent[0].otherMail,
                                                                               programType: infoStudent[0].programType,
                                                                               classStudent: infoStudent[0].classStudent,
                                                                               nation: infoStudent[0].nation,
                                                                               address: infoStudent[0].address)
                                        }
                                        callback(infoStudentResponse.success, statusInternet)
                                    }
                                } else {
                                    callback(false, statusInternet)
                                }
                            }
        }
    }
}
