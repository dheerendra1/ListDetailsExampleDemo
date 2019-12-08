//
//  Utils.swift
//  test
//
//  Created by Dheerendra Singh on 08/12/19.
//  Copyright © 2019 Dheerendra Singh. All rights reserved.
//
import UIKit
import SystemConfiguration
class Utils: NSObject {
    var helloStr = "Hi!!"
    var photoArray :NSMutableArray = []
    var mainView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
   static let sharedInstance = Utils()

    // MARK:- Check Internet
    class func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        //        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        //            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        //        }
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }

    class func setBorderForView (_ view:UIView ,radius:CGFloat,borderwidth:CGFloat)-> Void
    {
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = borderwidth
        view.layer.cornerRadius = radius
  
    }
    
   func addActivity(_ viewController:UIViewController) -> Void
    {
        activityIndicator = UIActivityIndicatorView(style:.large)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.startAnimating()
        activityIndicator.color = .white
        
        mainView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        mainView.center = viewController.view.center
        activityIndicator.center = viewController.view.center
        Utils.setBorderForView(mainView, radius: 10.0, borderwidth: 0.0)
        
        mainView.backgroundColor = UIColor.black
        viewController.view.addSubview(mainView)
        viewController.view.addSubview(activityIndicator)
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.isUserInteractionEnabled = false
        
    }
    func clearActivity(_ viewController:UIViewController) -> Void {
        activityIndicator.startAnimating()
        mainView.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.isUserInteractionEnabled = true
        
    }

}

