//
//  ContentView.swift
//  watchOS-Complication WatchKit Extension
//
//  Created by Johan Guenaoui on 12/05/2021.
//

import SwiftUI
import UserNotifications

@available(watchOSApplicationExtension 8.0, *)
struct ContentView: View {
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    let center = UNUserNotificationCenter.current()
    
    var body: some View {
        Button("Send Notification") {
            center.requestAuthorization(options: [.alert, .badge, .sound]){
                success, error in
                if (success) {
                    print("authorization given")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            
            let content = UNMutableNotificationContent()
            content.title = "A new planet was added"
            content.body = "Tatooine is now in the Solar System"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            center.add(request)
        }
        .opacity(isLuminanceReduced ? 0.5 : 1.0)
    }
}

@available(watchOSApplicationExtension 8.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().environment(\.isLuminanceReduced, true)
    }
}
