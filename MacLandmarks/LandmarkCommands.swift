//
//  LandmarkCommands.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI

// Untuk melakukan set pada keyboard macos pada beberapa fungsi tertentu
struct LandmarkCommands: Commands {
    
    // binding pada view dengan data
    @FocusedBinding(\.selectedLandmark) var selectedLandmark

    var body: some Commands {
        SidebarCommands()
        // Memberikan keyboard shortcuts untuk fitur save as favourite atau remove it dari favourite
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
