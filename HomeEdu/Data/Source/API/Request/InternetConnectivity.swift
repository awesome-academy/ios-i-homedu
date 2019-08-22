//
//  InternetConnectivity.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/22/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import Alamofire

final class InternetConnectivity {
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
