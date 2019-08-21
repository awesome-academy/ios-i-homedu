//
//  EditInfoRequest.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/21/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

final class EditInfoRequest {
    static let shared = EditInfoRequest()
    let reachabilityManager = NetworkReachabilityManager()
    let studentRepository = StudentRepository(local: StudentLocalDataSource())
    
    private init() {
    }
    
    func editInfo(_ param: Parameters,
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
                self.reachabilityManager?.startListening()
                self.reachabilityManager?.listener = { _ in
                    if let isNetworkReachable = self.reachabilityManager?.isReachable,
                        isNetworkReachable == true {
                        let infoStudentResponse = response.result.value
                        if let success = infoStudentResponse?.success {
                            callback(true, success)
                        }
                    } else {
                        callback(false, false)
                    }
                }
        }    }
}
