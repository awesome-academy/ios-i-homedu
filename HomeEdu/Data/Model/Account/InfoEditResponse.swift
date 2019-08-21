//
//  InfoEditResponse.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/21/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class InfoEditResponse: Mappable {
    var success: Bool?
    var message = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
    }
}

