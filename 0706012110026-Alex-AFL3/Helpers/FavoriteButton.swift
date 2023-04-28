//
//  FavoriteButton.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Merepresentasikan komponen favourite button
struct FavoriteButton: View {
    // variable yang menentukan apakah landmark merupakan tempat favourite user
    @Binding var isSet: Bool

        var body: some View {
            Button {
                // Untuk melakukan inverse dari current boolean value
                isSet.toggle()
            } label: {
                Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .yellow : .gray)
            }
        }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
