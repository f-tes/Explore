//
//  ExploreApp.swift
//  Explore
//
//  Created by felicia tan on 9/11/24.
//

import SwiftUI

// AppDelegate.swift
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Here we actually handle the notification
        print("Notification received with identifier \(notification.request.identifier)")
        // So we call the completionHandler telling that the notification should display a banner and play the notification sound - this will happen while the app is in foreground
        completionHandler([.banner, .sound])
    }
}

@main
struct ExploreApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
