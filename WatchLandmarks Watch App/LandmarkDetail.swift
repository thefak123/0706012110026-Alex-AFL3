//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by MacBook Pro on 24/04/23.
//

import SwiftUI

// Tampilan detail landmark pada watchOS
struct LandmarkDetail: View {
    // mendapatkan bankdata ataupun informasi dari landmark atau hikedata
    @EnvironmentObject var modelData: ModelData
    
    // Landmark yang ingin ditampilkan detailnya
    var landmark: Landmark
    
    
    // Mendapatkan index landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        ScrollView {
            VStack {
                // Menampilkan Gambar landmark
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                // Menampilkan nama landmark
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                // Menampilkan fitur toggle untuk membuat landmark yang dipilih menjadi favourite atau tidak
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }

                Divider()
                // Menampilkan nama taman pada landmark
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                // Menampilkan nama daerah landmark
                Text(landmark.state)
                    .font(.caption)

                Divider()
                
                // Menampilkan peta landmark berdasarkan koordinat
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")

            LandmarkDetail(landmark: modelData.landmarks[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
