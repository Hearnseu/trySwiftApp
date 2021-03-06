//
//  AppDelegate.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/9/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        configureStyling()
        setupImages()

        NSTimeZone.setDefaultTimeZone(NSTimeZone(abbreviation: "JST")!)
        return true
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
        // Restart any tasks that were paused (or not yet started) while the applicatakjfdsjklfasdadsfkljion was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

private extension AppDelegate {
    
    func configureStyling() {
        
        let tintColor = UIColor(red: 184.0/255.0, green: 50.0/255.0, blue: 43.0/255.0, alpha: 1.0)
        
        window?.tintColor = tintColor
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont.systemFontOfSize(18)
        ]
        
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().tintColor = .whiteColor()
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barStyle = .BlackTranslucent
    }
    
    func setupImages() {
        
        let speakerImages = Speaker.speakers.map {
            return (key: $0.image, image: Toucan(image: UIImage(named: $0.image)!).maskWithEllipse().image)
        }
        
        let sponsorImages = (Sponsor.diamondSponsors + Sponsor.goldSponsors + Sponsor.silverSponsors).map {
            return (key: $0.logo, image: UIImage(named: $0.logo)!)
        }
        
        let organizerImages = Organizer.organizers.map {
            return (key: $0.image, image: Toucan(image: UIImage(named: $0.image)!).maskWithEllipse().image)
        }

        ImageCache.sharedInstance.warmUp {
            return sponsorImages + speakerImages + organizerImages
        }
    }
}

