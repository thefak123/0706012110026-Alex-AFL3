//
//  LandmarkList.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI

// Tampilan list landmark secara vertikal khusus pada watchOS
struct LandmarkList: View {
    // mendapatkan Bankdata untuk landmarks ataupun hikedata
    @EnvironmentObject var modelData: ModelData
    
    // State untuk menentukan apakah landmark termasuk favorit atau tidak
    @State private var showFavoritesOnly = false
    
    // Berisi array of landmarks yang sudah difilter
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        // Menampilkan list landmark dengan navigasi ke landmark detail
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
