////
////  MedsView.swift
////  WaggAppiOS
////
////  Created by Simran Bhamra on 4/2/20.
////  Copyright © 2020 Simran Bhamra. All rights reserved.
////



//VStack{
//         List{
//             ForEach(mData.MedLogData){
//                 Text(String(MedLogData.medName))
//             }
//
//         }
//     }

import SwiftUI
import UserNotifications

struct MedsView: View {
     @ObservedObject private var mData = MedLogFirebaseData
     @State var isProfileViewPresented = false
    
    

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
      VStack{
                       
                       VStack{
                           Text("Current Medication")
                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                        .font(.title)
                            .padding(.top)
                      
                        
                        List{
                            ForEach(mData.MedLogData){ med in
                                Text("\(med.medName) every \(med.freq) days")
                            }
                        }
                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                        .font(.subheadline)
                                              .frame(width: 350, height: 500)
                                                 .background(Color.white)
                                                 .cornerRadius(15)
                                                 .shadow(color: Color.gray, radius: 5)
                                              .padding(.bottom,10 )
                                                 .padding(.top, 10)
                        


                       }
        Spacer()
        

        
        VStack{
//            Text("Medication Schedule")
//                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
//                .font(.title)
//                .frame(width: 350, height: 250)
//                .background(Color.white)
//                .cornerRadius(15)
//                .shadow(color: Color.gray, radius: 5)
//                .padding(.bottom,30 )
//                .padding(.top, 10)
            
            

    NavigationLink("Add Medication", destination: AddMeds())
            
            
            .frame(width: 150, height: 35)
            .foregroundColor(Color.white)
            .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
            .cornerRadius(15)
            
   
            

            
        }.navigationBarTitle("Medication ").navigationBarItems(trailing:
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

struct MedsView_Previews: PreviewProvider {
    static var previews: some View {
        MedsView()
    }
}


struct AddMeds : View {
    @State private var medsIndex = 0
     @State private var freqIndex = 0
    @State private var pickedTime = Date()
 
    @State private var selectedFreq = 0
    
    
    var meds = ["Flea and Tick", "Antibacterial Wipes","Heart Worm","Vetoryl Capsules"]
    var freq = ["Every day", "Every 7 days", "Every 14 days","Every 30 days", "Every year"]
   

    var body : some View{
     
        VStack {
            
            
            Form{
                
                Section{
                    Picker(selection: $medsIndex, label: Text("Medication Type")){
                        ForEach(0 ..< meds.count){
                            Text(self.meds[$0]).tag ($0)
                        }
                    }
                    
                    Picker(selection: $freqIndex, label: Text("Medication Frequency")){
                        ForEach(0 ..< freq.count){
                            Text(self.freq[$0]).tag ($0)
                        }
                    }
                    
                    
                
//                    VStack{
//                        Text("What time does the medication need to be taken?")
//                            .padding(.top)
//
//                        DatePicker("", selection:  $pickedTime, displayedComponents: .hourAndMinute)
//                            .labelsHidden()
//                    }
                    
                }
                
                
                
                
                
                
            }
            
                Button(action: {
                    self.addNewMeds()
                }) {
                    Text("Save")
                    
                     
                }.padding()
                    .frame(width: 100, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .cornerRadius(5)
                
        
          }.navigationBarTitle(Text("Add Medication"))
    
       
            

    }
    
    
    func addNewMeds(){

        var timeFreq = 0

        switch freq[freqIndex]{
        case "everyday":
            timeFreq = 1
            
        case "Every 7 days":
            timeFreq = 7

        case  "Every 14 days":
            timeFreq = 14

        case "Every 30 days":
            timeFreq = 30

        case "Every year":
            timeFreq = 365

        default:
          timeFreq = 1
        }

        MedLogFirebaseData.addMed(id: " UhdbFdhVa1fLO4BihUq6", freq: timeFreq, medName: meds[medsIndex], time: "8:00")
       addNotification()
        
        
//                let content = UNMutableNotificationContent()
//               content.title = "Medication notification"
//               content.subtitle = "Time to take \(meds[medsIndex] )"
//               content.sound = UNNotificationSound.default
//
//
//
//
//               var dateComponents = DateComponents()
//               dateComponents.weekday = timeFreq
//               dateComponents.hour = 8
//               dateComponents.minute = 0
//
//               let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//               let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//               UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//
//
//               // add our notification request
//               UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func addNotification (){
        let diDatas = MedLogFirebaseData
        let content = UNMutableNotificationContent()
        content.title = "Medication notification"
        content.subtitle = "Time to take \(meds[medsIndex] )"
        content.sound = UNNotificationSound.default
        
        
        
        diDatas.MedLogData.forEach { med in
            var dateComponents = DateComponents()
            dateComponents.weekday = med.freq
            dateComponents.hour = 8
            dateComponents.minute = 0
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
            // add our notification request
            UNUserNotificationCenter.current().add(request)
            
        }
        
        
        
        
        
        
        
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        
    }
    
    
}

               
