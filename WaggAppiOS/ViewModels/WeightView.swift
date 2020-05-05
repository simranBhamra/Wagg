//
//  WeightView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/2/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.



import SwiftUI
import SwiftUICharts



struct WeightView: View {
    @State var isProfileViewPresented = false
    @State private var weight = 0

    var weightArray = [110.0,23,54,32,12,37,7,23,112.0]

    var body: some View {
        ScrollView (.vertical, showsIndicators: false){
        VStack{

            VStack{


                Text("Current Weight")

                    .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .font(.title)

                Image("WeightIcon").resizable()
                    .frame(width: 60, height:60)
                    .padding(.bottom)
                TextField("Enter weight", value: $weight, formatter:NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)


                Button(action: {

                              self.weight = 76

                          }) {

                              Text("Save")
                          }
                        .frame(width: 60, height: 20)
                          .foregroundColor(Color.white)
                          .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                            .cornerRadius(5)







                Text(" the weight is \(weight)")



            } .frame(width: 350, height: 250)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
             .padding(.bottom,10 )
                .padding(.top, 10)




            VStack{
                LineView(data: weightArray, title: "Weight Trend", legend: "weight in lbs").padding()

            }.frame(width: 350, height: 450)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 5)

            .navigationBarTitle("Weight ").navigationBarItems(trailing:
                HStack(spacing: 15){

                    Button(action: {
                        print("Button tapped")
                        self.isProfileViewPresented = true
                    }) {
                        Image(systemName:  "person.circle.fill").font(.title).foregroundColor(.white)
                    }.sheet(isPresented: $isProfileViewPresented, content: {ProfileView()})
                }
            )
        }.padding(.leading, 10)
            .padding(.trailing, 10)

        .padding(.bottom,10 )
        }


    }
}






struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}


