//
//  ActivityProgressBar.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 5/4/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI

struct ActivityProgressBar: View {
    var value: Float
    var body: some View {
      GeometryReader{ geometry in
      ZStack(alignment: .leading)  {
          Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
              .opacity(0.3)
              .foregroundColor(Color(UIColor.systemTeal))
          
          Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
              .foregroundColor(Color(UIColor.systemBlue))
              .animation(.linear)
         
             }.cornerRadius(10.0)
         }
     }
}




