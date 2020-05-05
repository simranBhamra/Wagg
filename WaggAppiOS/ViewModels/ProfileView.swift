//
//  ProfileView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/1/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//


import SwiftUI
import UserNotifications

struct ProfileView: View {
    @ObservedObject private var diDatas = DogInfoFirebaseData

           @State private var nameValue = ""
          @State private var bdayValue = ""
          @State private var cNumValue = ""
       @State private var vNumValue = ""
           @State private var updateRowIDDogInfo = "UhdbFdhVa1fLO4BihUq6"
           @State private var updateRowValueDogInfo = 0.0
    
    
    @State private var isEditing = false
     @State private var text = ""
    
    
    var body: some View {
        
        
            
            NavigationView{
           
                    Form {
                        
                        
                        
                  VStack(alignment: .center){
                    Rectangle()
                        .frame(width: 120, height:150)
                        .cornerRadius(3)
                        .opacity(0)
                    CircleImagePP()
                        .offset (y:-130)
                        .padding(.bottom, -110)
                        }
                        
//                        TextField("Name: \(diDatas.didata[0].DogName)",
//                                  text: $nameValue)
//                            .disabled(!isEditing)
                        
                        
                        
                     TextField("Name: \(diDatas.didata[0].DogName)",
                     text: $nameValue ,
                                     onEditingChanged: { edit in
                                      print("Name Editted")
                           },
                                     onCommit: {
                                      DogInfoFirebaseData.updateDogName(id: self.updateRowIDDogInfo, DogNameUpdate: self.nameValue)
                           }).disabled(!isEditing)
                        
                        
                        
                        
                        
                        
                        TextField("Birthday: \(diDatas.didata[0].DogBDate)",
                        text: $bdayValue ,
                                        onEditingChanged: { edit in
                                         print("Birthday Editted")
                              },
                                        onCommit: {
                                            DogInfoFirebaseData.updateDogBDay(id: self.updateRowIDDogInfo, DogBDayUpdate: self.bdayValue)
                              }).disabled(!isEditing)
                        
                        
                        TextField("Chip Number: \(diDatas.didata[0].cNum)",
                            text: $cNumValue ,
                            onEditingChanged: { edit in
                                print("Chip number editted")
                        },
                            onCommit: {
                                DogInfoFirebaseData.updatecNum(id: self.updateRowIDDogInfo, cNumUpdate:Int( self.cNumValue) ?? 0 )
                        }).disabled(!isEditing)
                        
                        
                    
                        TextField("License Number: \(diDatas.didata[0].lNum)",
                            text: $vNumValue ,
                            onEditingChanged: { edit in
                                print("Chip number editted")
                        },
                            onCommit: {
                                DogInfoFirebaseData.updatevNum(id: self.updateRowIDDogInfo, vNumUpdate:  Int (self.vNumValue) ?? 0 )
                        }).disabled(!isEditing)
                        
                
            
            
                        
                        
                       
//                        VStack{
//                                     Button(action: {
//                                         self.isEditing = true
//                                     }) {
//                                         Text("Edit")
//                                     }
//
//                        }
//                        VStack{
//                                     Button(action: {
//                                         self.saveProfileButton()
//                                     }) {
//                                         Text("Save")
//                                     }
//                                     }
//
                        
                        VStack{
                                         Button("Allow Notification"){
                                             UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
                                             { success, error in
                                                 if success{
                                                     print("Permission granted")
                                                 }else if let error = error {
                                                     print(error.localizedDescription)
                                                 }
                                             }
                                         }  .frame(width: 300, height: 40)
                                             .foregroundColor(Color.white)
                                             .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                                             .cornerRadius(5)
                                            .padding(.bottom)
                                             

                        }
                        VStack{
                                         Button("Notification test"){
                                             let content = UNMutableNotificationContent()
                                             content.title = "Medication notification"
                                             content.subtitle = "Notification subtitle for nottfication"
                                             content.sound = UNNotificationSound.default

                                             let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                             let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                             // add our notification request
                                             UNUserNotificationCenter.current().add(request)

                                         }.frame(width: 300, height: 40)
                                         .foregroundColor(Color.white)
                                         .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                                         .cornerRadius(5)


                                     }
                        
                    }
                        
                        
                        
                                                
                                                                    
                    .navigationBarTitle(isEditing ? "Edit Profile" : "Profile")
                    .navigationBarItems(trailing: Button(isEditing ? "Save" : "Edit") {
                        self.isEditing.toggle()
                    })
                
                
            
                              
        
                
        }
            .edgesIgnoringSafeArea(.all)
    
    }
    
    func saveProfileButton(){
        DogInfoFirebaseData.updateDogName(id: self.updateRowIDDogInfo, DogNameUpdate: self.nameValue)
    }
    
}






struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


struct EditProfileView: View {
    @ObservedObject private var diDatas = DogInfoFirebaseData
         @State private var nameValue = ""
        @State private var bdayValue = ""
        @State private var cNumValue = ""
     @State private var vNumValue = ""
         @State private var updateRowIDDogInfo = "UhdbFdhVa1fLO4BihUq6"
         @State private var updateRowValueDogInfo = 0.0

    var body: some View{

        NavigationView{
            Form{
                TextField("Name",
                          text: $nameValue)
                TextField("Birthday",
                          text: $bdayValue)
                TextField("Chip Number",
                                      text: $cNumValue)
                
                TextField("License Number",
                                      text: $vNumValue)
                

            }.navigationBarTitle(Text("Edit Profile"))
            
            
        }
    }
}
