//
//  HomeView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/1/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//
//


import SwiftUI
import UserNotifications

struct HomeView: View {

    @State var isProfileViewPresented = false
    
    init() {
       let navBarAppearance = UINavigationBarAppearance()
              navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .init(displayP3Red: 20/255, green: 147/255, blue: 154/255, alpha: 1)
              navBarAppearance.shadowImage = nil // line
              navBarAppearance.shadowColor = nil // line
              UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).standardAppearance = navBarAppearance
              UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .white
   
        
       
     }

    
    var body: some View {
       
       
        NavigationView{
          
            ScrollView{
         
                
                VStack{
                NavigationLink("Meals",destination: FoodTrackerView())
                         .frame(width: 350, height: 200)
                         .background(Color.white)
                         .cornerRadius(15)
                         //.padding(29.0)
                         .padding(.leading, 10)
                         .padding(.top, 20)
                         .padding(.bottom, 20 )
                         .shadow(color: Color.gray, radius: 5)
                         .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                         .font(.title)
                         
                }
              
         
                 
                
                HStack{
                    NavigationLink("Activity", destination: ActivityView())
                    .frame(width: 170, height: 200)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.gray, radius: 5)
                    .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .font(.title)
//                    Button(action:{})
//                    {
//
//                        Text("Activiy")
//
//                        Image("ExcerciseIcon").resizable()
//                        .frame(width: 40, height:30)
//
//
//                    }
                    
                    
                 
                   
                    NavigationLink("Weight", destination:FirebaseWeight())
                    .frame(width: 170, height: 200)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.gray, radius: 5)
                    .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .font(.title)
                    
                 
                }
            
                
                VStack{

                 
                   
                     NavigationLink("Medication", destination: MedsView())
                    .frame(width: 350, height: 180)
                    .background(Color.white)
                    .cornerRadius(15)
                        .padding(.top, 25)
                    .shadow(color: Color.gray, radius: 5)
                    .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .font(.title)
                    
                }
                .frame(maxWidth: .infinity)
                
                
//                VStack{
//                    Button("Request Permission"){
//                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
//                        { success, error in
//                            if success{
//                                print("Permission granted")
//                            }else if let error = error {
//                                print(error.localizedDescription)
//                            }
//                        }
//                    }  .frame(width: 100, height: 40)
//                        .foregroundColor(Color.white)
//                        .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
//                        .cornerRadius(5)
//
//
//
//                    Button("Notification test"){
//                        let content = UNMutableNotificationContent()
//                        content.title = "Medication notification"
//                        content.subtitle = "Notification subtitle for nottfication"
//                        content.sound = UNNotificationSound.default
//
//                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//                        // add our notification request
//                        UNUserNotificationCenter.current().add(request)
//
//                    }.frame(width: 100, height: 40)
//                    .foregroundColor(Color.white)
//                    .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
//                    .cornerRadius(5)
//
//
//                }
                
            }.navigationBarTitle("Home").navigationBarItems(trailing:
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
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

