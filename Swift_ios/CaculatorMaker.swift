//
//  CaculatorMaker.swift
//  Swift_ios
//
//  Created by RHCT on 16/2/17.
//  Copyright © 2016年 ZL. All rights reserved.
//

import Foundation

class CaculatorMaker : NSObject {
    var result: Int = 0
    
    func add(value: Int) -> CaculatorMaker {
        result += value
        return self
    }
    
    func sub(value: Int) -> CaculatorMaker {
        result -= value
        return self
    }
    
    func muilt(value: Int) -> CaculatorMaker {
        result *= value
        return self
    }
    
    func divide(value: Int) -> CaculatorMaker {
        if value == 0 {
            result = 0
        } else {
            result /= value
        }
        return self
    }
}

extension NSObject {
}


