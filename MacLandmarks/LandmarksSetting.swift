//
//  LandmarksSetting.swift
//  MacLandmarks
//
//  Created by MacBook Pro on 26/04/23.
//

import SwiftUI

struct LandmarksSetting: View {
    
    // Menyimpan jarak map dengan tampilan app secara lokal
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
       Form {
       Picker("Map Zoom:", selection: $zoom) {
           ForEach(MapView.Zoom.allCases) { level in
               Text(level.rawValue)
           }
       }
       .pickerStyle(.inline)
       }
       .frame(width: 300)
       .navigationTitle("Landmark Settings")
       .padding(80)
    }
}

struct LandmarksSetting_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksSetting()
    }
}
