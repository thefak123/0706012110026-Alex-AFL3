//
//  CategoryItem.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Merepresentasikan suatu block landmark pada categoryRow
struct CategoryItem: View {
    // Data object current landmark
    var landmark: Landmark
    var body: some View {
        // Informasi landmark
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
