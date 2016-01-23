//
//  TaskServices.swift
//  Swift_ios
//
//  Created by zhangliang on 16/1/23.
//  Copyright © 2016年 ZL. All rights reserved.
//

import Foundation
import SwiftyJSON

class TaskService {
    class func getTasks(success:((tasks: [Task]) -> Void)? = nil, fail:((statusCode: Int)->Void)? = nil) {
        HttpRequst.get("",
            onSuccess: { (json) -> Void in
                
                if let su = success, let arr = json?["tasks"].array {
                    var array = Array<Task>()
                    for tmp in arr {
                        let task = Task(json: tmp)
                        array.append(task)
                    }
                    su(tasks: array)
                }
                
            }) { (statusCode, badRequest) -> Void in
                if let fa = fail, let sc = statusCode {
                    fa(statusCode: sc)
                }
        }
    }
}
