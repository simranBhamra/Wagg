//
//  CircleImagePP.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 3/21/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI

struct CircleImagePP: View {
    var body: some View {
        Image("LilyWagg")
        .clipShape(Circle())
        .aspectRatio(contentMode: .fit)
        .overlay(
            Circle().stroke(Color.white, lineWidth: 0.05))
        .shadow(radius: 10)
    }
}

struct CircleImagePP_Previews: PreviewProvider {
    static var previews: some View {
        CircleImagePP()
    }
}
