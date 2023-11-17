//
//  Text_NotifyApp.swift
//  Text_Notify
//
//  Created by Aniket Singh on 15/11/23.
//

import SwiftUI

@main
struct Text_NotifyApp: App {
    @StateObject private var notificationManager = NotificationManager.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
