//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by M Usman Saeed on 28/03/2018.
//  Copyright © 2018 SAS Studio. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

let baseUrl : String = "https://maps.googleapis.com/maps/api/geocode/json?"

class NetworkManager: NSObject {
    typealias successCallback = (_ result: NSDictionary) -> Void
    typealias failureCallback = (_ error: NSDictionary?) -> Void
    
    class func callApi(_ strURL: String, httpMethod: HTTPMethod , parameters: [String: AnyObject], success:@escaping successCallback, failure:@escaping failureCallback) {
    
        if httpMethod == HTTPMethod.get {
            
            Alamofire.request(baseUrl + strURL, parameters: parameters).responseJSON { (responseObject) -> Void in
                
                print(responseObject)
                
                if responseObject.result.isSuccess {
                    let JSON = responseObject.result.value as? NSDictionary
                    if (JSON != nil) {
                        success(JSON!)
                    }
                    else {
                        failure(["error":"API Format Error", "statusCode":999])
                    }
                }
                if responseObject.result.isFailure {
                    let httpError: NSError = responseObject.result.error! as NSError
                    let statusCode = httpError.code
                    let error:NSDictionary = ["error" : httpError,"statusCode" : statusCode]
                    failure(error)
                }
            }

        }else if httpMethod == HTTPMethod.post {
            
            Alamofire.request(baseUrl + strURL, method: .post, parameters: parameters).responseJSON { (responseObject) -> Void in
                print(responseObject)
                
                if responseObject.result.isSuccess {
                    let JSON = responseObject.result.value as? NSDictionary
                    if (JSON != nil) {
                        success(JSON!)
                    }
                    else {
                        failure(["error":"API Format Error", "statusCode":999])
                    }
                }
                if responseObject.result.isFailure {
                    let httpError: NSError = responseObject.result.error! as NSError
                    let statusCode = httpError.code
                    let error:NSDictionary = ["error" : httpError,"statusCode" : statusCode]
                    failure(error)
                }
            }
        }
    }
    
}
