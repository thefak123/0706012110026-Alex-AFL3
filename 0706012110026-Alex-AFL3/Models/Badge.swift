//
//  Badge.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Merepresentasikan badge symbol untuk user profile
struct Badge: View {
    var badgeSymbols: some View {
           ForEach(0..<8) { index in
               RotatedBadgeSymbol(
                   angle: .degrees(Double(index) / Double(8)) * 360.0
               )
           }
           .opacity(0.5)
       }
       
       var body: some View {
           // badge background dan badge symbols yang tertumpuk membentuk badge secara keseluruhan
           ZStack {
               BadgeBackground()
               
               GeometryReader { geometry in
                   badgeSymbols
                       .scaleEffect(1.0 / 4.0, anchor: .top)
                       .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
               }
           }
           .scaledToFit()
       }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
