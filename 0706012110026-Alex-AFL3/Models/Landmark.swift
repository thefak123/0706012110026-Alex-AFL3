//
//  Landmark.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

// Struct untuk merepresentasikan object landmark
struct Landmark: Hashable, Codable, Identifiable {
    // Merepresentasikan id landmark (Unique identifiers)
    var id: Int
    // Nama landmark
    var name: String
    // Taman landmark
    var park: String
    // Daerah bagian landmark
    var state: String
    // Deskripsi landmark
    var description: String
    // Menentukan apakah landmark termasuk user favourite
    var isFavorite : Bool
    // Category landmark
    var category: Category
    // Apakah tergolong landmark yang disarankan
    var isFeatured: Bool
    
    // Jenis-jenis category landmark yang tersedia
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // Gambar khusus untuk section feature di halaman featured
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    // Nama gambar
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    // Koordinat lokasi
    private var coordinates: Coordinates
    
    // Koordinat lokasi dari latitude dan longitude
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // Struct yang merepresentasikan suatu koordinat
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
