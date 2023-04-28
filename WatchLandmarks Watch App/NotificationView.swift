//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by MacBook Pro on 24/04/23.
//

import SwiftUI

// Representasi tampilan notifikasi
struct NotificationView: View {
    // Judul notifikasi
    var title: String?
    
    // Pesan notifikasi
    var message: String?
    
    // Landmark yang diberitaukan pada notifikasi
    var landmark: Landmark?

    var body: some View {
        VStack {
            // Jika landmark terdeteksi
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            
            // Jika landmark tidak terdeteksi

            Text(title ?? "Unknown Landmark")
                .font(.headline)

            Divider()

            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock",
                             message: "You are within 5 miles of Turtle Rock.",
                             landmark: ModelData().landmarks[0])
        }

    }
}
