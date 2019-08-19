//
//  ScoreTerm.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 8/19/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

final class ScoreTerm: Mappable {
    var title = ""
    var subjects = [ScoreSubject]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        subjects <- map["subjects"]
    }
}
