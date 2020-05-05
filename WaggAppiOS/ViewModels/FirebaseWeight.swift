//
//  FirebaseWeight.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/23/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.

import SwiftUI
import Firebase
import FirebaseFirestore
import SwiftUICharts

struct FirebaseWeight: View {
     @State var isProfileViewPresented = false
    @State private var textValue = ""
    @State private var updateRowID = ""
    @State private var updateRowValue = 0.0
    @State private var isUpdate = false
    @ObservedObject private var datas = firebaseData
    
    var weightArray = [110.0,23,54,32,12,37,7,23,112.0]
    var weightArray2 = [Double]()
    
    
    
    
    var body: some View {
          ScrollView (.vertical, showsIndicators: false){
        VStack {
//                        List {
//                            ForEach(datas.data){ data in
//                                HStack {
//                                    Button(action: {
//                                        self.isUpdate = true
//                                        self.updateRowID = data.id
//                                        self.updateRowValue = data.weight
//                                    }) {
//                                        Text(String(data.weight))
//                                    }
//                                }
//                            }.onDelete { (index) in
//                                firebaseData.deleteData(datas: self.datas, index: index)
//                            }
//                        }
//                        self.isUpdate ? Text("The value ( \(updateRowValue) ) will chage") : nil
//
            
            VStack {
                Spacer()
                Text("Track Weight")
                    
                    .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .font(.title)
                
                Image("WeightIcon").resizable()
                    .frame(width: 60, height:60)
                    .padding(.bottom)
                TextField("Enter Weight", text: $textValue).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
                Button(action: {
                    self.doItButton()
                }) {
                    Text("Save")
                }
                Spacer()
               
            }.frame(width: 350, height: 250)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .padding(.bottom,10 )
                .padding(.top, 10)
            
            
            
            VStack{
                
               
                
                LineView(data:editArray(datas: datas),
                         title: "Weight Trend", legend: "weight in lbs").padding()
                
            }.frame(width: 350, height: 450)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
             Spacer()
            
            
            VStack{
                 Spacer()
                Text("Weight History")
                                   
                                   .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                                   .font(.title)
                List{
                    ForEach(datas.data){ data in
                        HStack {
                            Button(action: {
                                self.isUpdate = true
                                self.updateRowID = data.id
                                self.updateRowValue = data.weight
                            }) {
                                Text(String(data.weight))
                            }
                        }
                    }.onDelete { (index) in
                        firebaseData.deleteData(datas: self.datas, index: index)
                    }
                }
                
            }.frame(width: 350, height: 300)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 5)
            
            
        
            
            
            
      }
                .padding(.leading, 10)
        .padding(.trailing, 10)

        .padding(.bottom,10 )
            .navigationBarTitle("Weight").navigationBarItems(trailing:
                
                HStack(spacing: 15){

                    Button(action: {
                        print("Button tapped")
                        self.isProfileViewPresented = true
                    }) {
                        Image(systemName:  "person.circle.fill").font(.title).foregroundColor(.white)
                    }.sheet(isPresented: $isProfileViewPresented, content: {ProfileView()})
                }
            )
            
            
        }
        
        
    }
    
   func doItButton() {
        self.isUpdate ? firebaseData.updateData(id: self.updateRowID, weighttxt: Double(self.textValue) ?? 0) : firebaseData.createData(w1: Double(self.textValue) ?? 0)
        self.isUpdate = false
        self.textValue = ""
   
        
    }
}
func editArray(datas: FirebaseData ) -> Array<Double>{
     var weightArrayCopy = [Double]()
   // weightArrayCopy.append(Double(textValue) )
    print("Hello")
    
    
    datas.data.forEach { data in
        weightArrayCopy.append(Double(data.weight))
    };
    
    
    return weightArrayCopy
     
}


struct FirebaseWeight_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseWeight()
    }
}
