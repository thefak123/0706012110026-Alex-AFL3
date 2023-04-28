//
//  RotateBadgeSymbol.swift
//  0706012110026-Alex-AFL3
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Merepresentasikan badget symbol dengan kemiringan tertentu
struct RotatedBadgeSymbol: View {
    // Sudut kemiringan
    let angle: Angle
        
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotateBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
