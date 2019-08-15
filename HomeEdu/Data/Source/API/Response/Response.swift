//
//  Response.swift
//  HomeEdu
//
//  Created by Minh Mon on 8/15/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class Response<T>: Mappable {
    var success: Int?
    var message: String?
    var data: [T]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        data <- map["data"]
    }
}

