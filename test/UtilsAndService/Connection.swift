//
//  Connection.swift
//  test
//
//  Created by Dheerendra Singh on 18/11/19.
//  Copyright © 2019 Dheerendra Singh. All rights reserved.
//
import UIKit

// Development
let baseURl = "https://api.myjson.com/bins/18buhu"

// Production
//let baseURl = "https://beta.alliancehome.com/tracker/api/"


class Connection: NSObject, URLSessionDelegate {
    
    
    class func callGETServiceWithName(responeBlock:@escaping ((_ response : AnyObject?, _ error:NSError?) -> Void)) -> Void {

        let connection = Connection()
        
        let urlconfig = URLSessionConfiguration.default
        let session = Foundation.URLSession(configuration: urlconfig, delegate: connection, delegateQueue: OperationQueue.main)
        
        
        urlconfig.timeoutIntervalForRequest = 30.0
        urlconfig.timeoutIntervalForResource = 60.0
        
        
        let request = NSMutableURLRequest(url: URL(string: baseURl)!)
        
        request.httpMethod = "GET"
                
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            
            if(error != nil) {
                
               // print(error!.localizedDescription)
                if data != nil{
                    //let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    //print("Error could not parse JSON: '\(String(describing: jsonStr))'")
                }
                else{
                    
                }
                
                responeBlock(nil, error as NSError?)
                
            }
            else {
                //let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                //print("Error could not parse JSON: '\(String(describing: jsonStr))'")
                responeBlock(data as AnyObject?, error as NSError?)
                
            }
        })
        task.resume()
    }
    
    
//    func URLSession(_ session: Foundation.URLSession, task: URLSessionTask, didReceiveChallenge challenge: URLAuthenticationChallenge, completionHandler: (Foundation.URLSession.AuthChallengeDisposition, URLCredential?) -> Void)
//    {
//
//        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust
//        {
//            let credential = URLCredential(trust:
//                challenge.protectionSpace.serverTrust!)
//            completionHandler(.useCredential, credential)
//
//        } else
//        {
//
//            let credential = URLCredential(user:"Administrator", password:"1L0ng3RP4$$w0rd", persistence: .forSession)
//
//            challenge.sender?.use(credential, for: challenge)
//
//            completionHandler(Foundation.URLSession.AuthChallengeDisposition.useCredential,credential)
//
//
//        }
//
//    }
}
