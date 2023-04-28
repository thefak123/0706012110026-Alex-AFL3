//
//  LandmarkRow.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Merepresentasikan row yang ada pada landmarkList
struct LandmarkRow: View {
    // Current landmark
    var landmark: Landmark

    var body: some View {
        HStack {
            // Gambar landmark
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                // Style tambahan ketika device yang dipakai adalah watchOS
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }

            Spacer()
            // Jika landmark yang dipilih merupakan favourite, maka ganti gambar menjadi star.fill
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
