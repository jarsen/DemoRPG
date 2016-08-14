//
//  AppDelegate.swift
//  DemoRPG
//
//  Created by Jason Larsen on 8/13/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var desktopDaemon = DesktopDaemon(path: "/Users/jason.larsen/Code/DemoRPG/state.json")

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

