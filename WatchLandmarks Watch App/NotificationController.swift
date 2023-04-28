//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by MacBook Pro on 24/04/23.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    // Landmark yang akan dinotifikasikan
    var landmark: Landmark?
    // Judul notifikasi
    var title: String?
    
    // Pesan notifikasi
    var message: String?
    
    // Key untuk data bertipe dictionary dari notificationData
    let landmarkIndexKey = "landmarkIndex"

    override var body: NotificationView {
        NotificationView(title: title,
            message: message,
            landmark: landmark)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Fungsi ketika menerima notifikasi
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()

        // pengambilan data dari notifikasi yang terdeteksi
        let notificationData =
            notification.request.content.userInfo as? [String: Any]
        
        // aps atau singkatan dari "Apple Push Notification service" berisi berbagai informasi mengenai notifikasi, seperti informasi alert (Pesan yang ingin disampaikan), sound, category dll
        let aps = notificationData?["aps"] as? [String: Any]
        // alert untuk mendapatkan pesan notifikasi yang terdeteksi
        let alert = aps?["alert"] as? [String: Any]
        
        // Judul notifikasi
        title = alert?["title"] as? String
        
        // Pesan notifikasi
        message = alert?["body"] as? String
        
        // mendapatkan index landmark
        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
