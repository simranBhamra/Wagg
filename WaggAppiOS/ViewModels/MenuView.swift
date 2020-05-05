//
//  MenuView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 3/19/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image( systemName: "house")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Home")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding(.top, 100)
            
            HStack{
                           Image( systemName: "hare")
                               .foregroundColor(.white)
                               .imageScale(.large)
                           Text("Food")
                               .foregroundColor(.white)
                               .font(.headline)
                       }
                       .padding(.top, 30)
            
            HStack{
                                      Image( systemName: "heart.circle")
                                          .foregroundColor(.white)
                                          .imageScale(.large)
                                      Text("Excercise")
                                          .foregroundColor(.white)
                                          .font(.headline)
                                  }
                                  .padding(.top, 30)
            
            HStack{
                                      Image( systemName: "gauge")
                                          .foregroundColor(.white)
                                          .imageScale(.large)
                                      Text("Weight")
                                          .foregroundColor(.white)
                                          .font(.headline)
                                  }
                                  .padding(.top, 30)
            
            HStack{
                                      Image( systemName: "bandage")
                                          .foregroundColor(.white)
                                          .imageScale(.large)
                                      Text("Medication")
                                          .foregroundColor(.white)
                                          .font(.headline)
                                  }
                                  .padding(.top, 30)
            
            HStack{
                                      Image( systemName: "magnifyingglass.circle")
                                          .foregroundColor(.white)
                                          .imageScale(.large)
                                      Text("Help & FAQs")
                                          .foregroundColor(.white)
                                          .font(.headline)
                                  }
                                  .padding(.top, 30)
            Spacer()
        }
    .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color( red: 0/256, green: 147/256, blue: 154/256))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}


