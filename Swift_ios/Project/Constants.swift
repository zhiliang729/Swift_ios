//
//  Constants.swift
//  OnePage_ios
//
//  Created by RHCT on 15/11/11.
//  Copyright © 2015年 RHCT. All rights reserved.
//

import UIKit
import XCGLogger


// MARK:  - api地址
//MARK: -- 需要通过环境来设置
public let APIDOMAIN = "http://192.168.2.102:5000/"

// MARK:  - 全局消息name
//MARK: -- 用户登录后的通知
public let USER_LOGINED_NOTIFICATION  = "USER_LOGINED_NOTIFICATION"


// MARK:  - 常量
//MARK: -- 屏幕宽度
public let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width

//MARK: -- 屏幕高度
public let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height


// MARK: - 全局 log
//MARK: -- 打印到output的log
let logger:XCGLogger = XCGLogger.defaultInstance()

//MARK: -- 若不能实时追踪，可以将log保存到文件中
let fileLogger:XCGLogger = XCGLogger()

