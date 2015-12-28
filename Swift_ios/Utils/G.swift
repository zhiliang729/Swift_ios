//
//  G.swift
//  OnePage_ios
//
//  Created by RHCT on 15/11/11.
//  Copyright © 2015年 RHCT. All rights reserved.
//

import Foundation

//全局对象
public class G {
    
    internal static let _g = G();
    
    //returns the singleton instance
    public class func sharedManager() -> G {
        return _g
    }
    
    internal init() {
        Global.initFileLogger()
        Global.initLogger()
    }
    
    
}
