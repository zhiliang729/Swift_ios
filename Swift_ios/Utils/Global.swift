//
//  Global.swift
//  OnePage_ios
//
//  Created by RHCT on 15/11/11.
//  Copyright © 2015年 RHCT. All rights reserved.
//

import Foundation
import XCGLogger
import SwiftFilePath

class Global {
    
    private static let dateFormatter =  getdateFormatter()
    
    class func initLogger() {
        logger.dateFormatter = dateFormatter
        logger.setup(.Debug, showThreadName: false, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLogLevel: .Debug)
    }
    
    class func initFileLogger() {
        let cachePath:Path = Path.cacheDir["log.log"]
//        logger.debug(cachePath.toString())
        fileLogger.dateFormatter = dateFormatter
        fileLogger.setup(.None, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile:cachePath.toString(), fileLogLevel: .Debug)
    }
    
}

