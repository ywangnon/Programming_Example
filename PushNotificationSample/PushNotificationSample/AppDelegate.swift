//
//  AppDelegate.swift
//  PushNotificationSample
//
//  Created by Hansub Yoo on 2021/02/09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let content = UNMutableNotificationContent()
//        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
//        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time", arguments: nil)
//        content.sound = UNNotificationSound.default
//        content.categoryIdentifier = "SoundTest"
        
        let center = UNUserNotificationCenter.current()
//        let generalCategory = UNNotificationCategory(identifier: "SoundTest", actions: [], intentIdentifiers: [], options: .customDismissAction)
//        center.setNotificationCategories([generalCategory])
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard granted else {
                print("NO")
                return
            }
            
            print("OK")
            
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        
        print("APNs device token: \(deviceTokenString)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
}

