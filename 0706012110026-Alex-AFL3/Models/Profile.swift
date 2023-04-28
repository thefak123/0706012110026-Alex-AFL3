//
//  Profile.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 20/04/23.
//

import Foundation

// Merepresentasikan struct untuk user profile
struct Profile {
    // Username dari pengguna
    var username: String
    // Penggunaan notifikasi
    var prefersNotifications = true
    // foto season
    var seasonalPhoto = Season.winter
    // tanggal goal ingin dicapai
    var goalDate = Date()
    
    // nama user profile secara default
    static let `default` = Profile(username: "Alex")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}

