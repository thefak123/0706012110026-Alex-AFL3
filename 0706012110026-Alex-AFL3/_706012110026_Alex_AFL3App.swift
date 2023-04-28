//
//  _706012110026_Alex_AFL3App.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

@main
struct _706012110026_Alex_AFL3App: App {
    @StateObject private var modelData = ModelData()

       var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(modelData)
           }
           #if !os(watchOS)
           .commands {
               LandmarkCommands()
           }
           #endif
           
           
           #if os(watchOS)
           WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
           #endif

           #if os(macOS)
           Settings {
               LandmarksSetting()
           }
           #endif
       }
}
