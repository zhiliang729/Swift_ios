//
//  HTTP.swift
//  Swift_ios
//
//  Created by zhangliang on 16/1/23.
//  Copyright © 2016年 ZL. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

public class BadRequest {
    let statusCode = 400
    var message:String?
    var code:Int
    var errors:[ErrorItem]?
    
    init(json:SwiftyJSON.JSON){
        self.code = json["code"].intValue
        self.message = json["message"].stringValue
        self.errors = [ErrorItem]()
        for errorItem in json["errors"].arrayValue{
            self.errors?.append(ErrorItem(json:errorItem))
        }
    }
    
    
}

public class ErrorItem{
    var type:String
    var error:[String] = [String]()
    init(json:SwiftyJSON.JSON){
        self.type = json["type"].stringValue
        for e in json["error"].arrayValue{
            self.error.append(e.stringValue)
        }
    }
}


/// HTTP 请求
public class HttpRequst {
    
    public static var baseUrlString: String {
        get {
            return APIDOMAIN
        }
    }
    
    private static var manager: Alamofire.Manager {
        let manager =  Alamofire.Manager.sharedInstance
        manager.session.configuration.HTTPAdditionalHeaders = [
            "Accept-Language": "en;q=1.0,fr;q=0.9,de;q=0.8,zh-Hans;q=0.7,zh-Hant;q=0.6,ja;q=0.5",
            "Accept-Encoding": "gzip;q=1.0,compress;q=0.5",
            "User-Agent":self.userAgent()
        ]
        
        //超时时间
        manager.session.configuration.timeoutIntervalForRequest  = 3 //seconds
        manager.session.configuration.timeoutIntervalForResource = 3
        
        return manager
    }
    
    private class func userAgent() -> String {
        let appVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
        let sysType = "iOS"
        let sysVersion = UIDevice.currentDevice().systemVersion
        
        var sysInfo:[CChar] = Array(count:sizeof(utsname), repeatedValue: 0)
        let identifier = sysInfo.withUnsafeMutableBufferPointer { (inout ptr: UnsafeMutableBufferPointer<CChar>) -> String in
            uname(UnsafeMutablePointer<utsname>(ptr.baseAddress))
            let machinePtr = ptr.baseAddress.advancedBy(Int(_SYS_NAMELEN * 4))
            return String.fromCString(machinePtr)!
        }
        let userAgentInfoArr = [appVersion, sysType, sysVersion, identifier]
        let userAgentStr = userAgentInfoArr.joinWithSeparator("/")
        return userAgentStr
    }
    
    private class func processError(statusCode:Int){
        if statusCode >= 500{
        }else if statusCode == 403{
        }else if statusCode == 404{
        }else {
        }
    }
    
    
    private class func send(
        method: Alamofire.Method,
        path:String,
        parameters: [String: String]? = nil,
        onSuccess:((json:SwiftyJSON.JSON?)->Void)? = nil,
        onFail:((statusCode:Int?,badRequest:BadRequest?)->Void)? = nil ){
            let requestUrl = NSURLRequest(URL: NSURL(string: HttpRequst.baseUrlString + path)!)
            manager.request(method, requestUrl, parameters: parameters)
                .responseString { respo in
                    /// 发生错误 回传 statusCode = nil 表示失败 
                    /// 连接超时 找不到域名 等会发生此错误
                    if let er  = respo.result.error {
                        logger.debug("error:\(er)")
                        if let onFail = onFail{
                            onFail(statusCode: -1011,badRequest:nil)
                        }
                    }
                    
                    if let r = respo.response {
                        let statusCode = r.statusCode
                        if statusCode == 200 {//成功
                            if let onSuccess = onSuccess{
                                if let dataFromString = respo.result.value!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                                    let json = JSON(data: dataFromString)
                                    onSuccess(json: json)
                                }
                            }
                        }else if statusCode == 400{//badRequest
                            if let onFail = onFail{
                                if let dataFromString = respo.result.value!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                                    let json = JSON(data: dataFromString)
                                    let badRequest : BadRequest = BadRequest(json: json)
                                    onFail(statusCode: statusCode,badRequest:badRequest)
                                }
                            }
                        }else{//其他情况
                            self.processError(statusCode)
                            if let onFail = onFail{
                                onFail(statusCode: statusCode,badRequest:nil)
                            }
                        }
                    }else{
                        if let onFail = onFail{
                            onFail(statusCode: -1011,badRequest:nil)
                        }
                    }
            }
            
            
    }

    
    
    public class func get(
        path:String,
        parameters: [String: String]? = nil,
        onSuccess:((json:SwiftyJSON.JSON?)->Void)? = nil ,
        onFail:((statusCode:Int?,badRequest:BadRequest?)->Void)? = nil ){
            send(.GET, path: path, parameters: parameters, onSuccess: onSuccess, onFail: onFail)
    }
    
    

    
    public class func post(
        path:String,
        parameters: [String: String]? = nil,
        onSuccess:((json:SwiftyJSON.JSON?)->Void)? = nil ,
        onFail:((statusCode:Int?,badRequest:BadRequest?)->Void)? = nil ){
            send(.POST, path: path, parameters: parameters, onSuccess: onSuccess, onFail: onFail)
    }
    
    
    public class func delete(
        path:String,
        parameters: [String: String]? = nil,
        onSuccess:((json:SwiftyJSON.JSON?)->Void)? = nil ,
        onFail:((statusCode:Int?,badRequest:BadRequest?)->Void)? = nil){
            send(.DELETE, path: path, parameters: parameters, onSuccess: onSuccess, onFail: onFail)
    }
   
}
