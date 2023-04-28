//
//  CircleImage.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

// Merepresentasikan komponen gambar yang berbentuk lingkaran
struct CircleImage: View {
    // Current image
    var image : Image
    var body: some View {
        image
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: ModelData().landmarks[0].image)
    }
}
