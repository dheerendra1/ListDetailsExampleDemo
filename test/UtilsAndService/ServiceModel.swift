//
//  ServiceModel.swift
//  test
//
//  Created by Dheerendra Singh on 08/12/19.
//  Copyright © 2019 Dheerendra Singh. All rights reserved.
//
import UIKit

class ServiceModel: NSObject {
    

    //MARK:- Movie List Service Call
    class func getMovieList( block:@escaping (( _ success : Bool?,  _ response:Data?,  _ error:NSError?) -> Void)) -> Void {
        Connection.callGETServiceWithName { (response, error) in
            if error != nil
            {
                if error!.domain == "internet error"
                {
                    block(false, nil, error!)
                }else{
                    block(nil, nil, error!)
                    
                }
            }
            else{
                block(true, response as? Data, error)
            }
        }
    }
}
