//
//  CategoryHome.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 3/21/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.init(red: 0/256, green: 147/256, blue: 154/256))
                 .frame( height: 180)
                .offset(y: -250)
      CircleImagePP()
                .offset (y:-130)
                .padding(.bottom, -130)
                
     VStack(alignment: .center) {
                            Text("Lily")
                                .font(.title)
                           
                        }
                        .padding()
 
                        Spacer()
                    }
                }
            }

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .background(Color.init(red: 0/256, green: 147/256, blue: 154/256))
    }
}
