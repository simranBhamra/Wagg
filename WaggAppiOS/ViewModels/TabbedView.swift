//
//  TabbedView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/1/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI



struct TabbedView: View {
    var body: some View {
        TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                           
                            Text("Home")
                        }
//                      ProfileView()
//                        .tabItem {
//                               Image(systemName: "person.fill")
//                               Text("Profile")
//                                   }
           FoodTrackerView()
            .tabItem {
                   Image(systemName: "hare")
                   Text("Meals")
                       }
            
            ActivityView()
            .tabItem {

                   Image(systemName: "heart.circle")
                   Text("Activity")
                       }
//            FirestoreSearchFood()
//                .tabItem{
//                    Text("SearchBar")
//            }
            
//            MedsView()
//                      .tabItem {
//                             Image(systemName: "cloud")
//                             Text("Medication")
//                                 }
//
//
//            WeightView()
//                      .tabItem {
//                             Image(systemName: "cloud")
//                             Text("Weight")
//                                 }


                   
                }
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
