//
//  Task.swift
//  Swift_ios
//
//  Created by zhangliang on 16/1/23.
//  Copyright © 2016年 ZL. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Task {
    var id: Int
    var title: String
    var description: String
    var done: Bool
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        done = json["done"].boolValue
    }
}
