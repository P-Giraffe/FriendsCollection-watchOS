//
//  NotificationController.swift
//  FriendsCollection-watchOSApp Extension
//
//  Created by Johan Guenaoui on 05/05/2021.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {

    override var body: NotificationView {
        return NotificationView()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) {
            success, error in
            if(success) {
                print("authorization given")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
extension NotificationController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch(response.actionIdentifier) {
        case "add": print("Janice is in you favorites now !")
        default: print("not identified")
        }
        completionHandler()
    }
}
