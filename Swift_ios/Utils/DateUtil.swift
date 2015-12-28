//
//  DateUtil.swift
//  OnePage_ios
//
//  Created by RHCT on 15/11/11.
//  Copyright © 2015年 RHCT. All rights reserved.
//

import Foundation

func getdateFormatter(dateFormat: String = "yyyy-MM-dd hh:mm:ss") -> NSDateFormatter{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = dateFormat
    dateFormatter.locale = NSLocale.currentLocale()
    return dateFormatter
}
