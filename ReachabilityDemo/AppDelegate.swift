//
//  AppDelegate.swift
//  ReachabilityDemo
//
//  Created by sherry on 16/6/17.
//  Copyright © 2016年 sherry. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var hostReach: Reachability!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //开启网络状态的监听
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reachChange), name: kReachabilityChangedNotification, object: nil)
        
        //初始化
        hostReach = Reachability(hostName: "www.google.com")
        //开启监听，会启动一个runloop
        hostReach.startNotifier()
        
        return true
    }
    
    //连接改变
    func reachChange(noti: NSNotification) {
    
        let curReach = noti.object as! Reachability
    
        //获取当前网络状态
        let status = curReach.currentReachabilityStatus()
        
        switch status.rawValue {
        case 0:
            print("没有网络连接")
        case 1:
            print("wifi连接")
        case 2:
            print("蜂窝连接")
        default:
            break
        }
    
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

