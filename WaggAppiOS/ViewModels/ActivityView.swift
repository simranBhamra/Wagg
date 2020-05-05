//
//  ActivityView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/2/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI
import Firebase

struct ActivityView: View {
    @State var isProfileViewPresented = false
    @State var ActiveProgressValue: Float = 0.0
    @ObservedObject var data = getData()
    @ObservedObject private var diDatas = DogInfoFirebaseData
        @ObservedObject private var ADatas = ActivityLogFirebaseData
    
    
    var body: some View {
        
        
        
        VStack{
            
            
            VStack(alignment: .leading){
                Text("Activity Log")
                    .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .font(.title)
           
                    
                    
                    Text("\(String(describing: ADatas.getDailyActivity()))" + "/" +
                                          "\(diDatas.didata[0].targetActivity)")
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    
                
                
                
                
                 ActivityProgressBar(value: (Float(ADatas.getDailyActivity())/Float(diDatas.didata[0].targetActivity))).frame(width: 300, height: 20)
                
            }.frame(width: 350, height: 175)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 5)
            .padding(.bottom)
            HStack{
                HStack{
                      NavigationLink("Running", destination: RunningView())
                    .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                    .font(.title)
                        Image("RunningDog").resizable()
                        .frame(width: 40, height:40)
                                                   
                        
                }.frame(width: 175, height: 150)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .padding(.bottom)
                
                
                HStack{
                   
                NavigationLink("Walking", destination: WalkingView())
                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                        .font(.title)
                    Image("WalkingDog").resizable()
                                           .frame(width: 40, height:40)
                       
                }.frame(width: 175, height: 150)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .padding(.bottom)
                
                
            } 
            
            HStack{
                HStack{
                      NavigationLink("Playing", destination: PlayingView())
                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                        .font(.title)
                    Image("PlayDog").resizable()
                                                              .frame(width: 40, height:40)
                        
                    
                }.frame(width: 175, height: 150)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .padding(.bottom)
                HStack{
                    NavigationLink("Set Target", destination: SetTargetView())
                      
                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                        .font(.title)
                        
                }.frame(width: 175, height: 150)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .padding(.bottom)
                
                
            }
                
                
                
            .navigationBarTitle("Activity ").navigationBarItems(trailing:
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

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}



//class getActivityData : ObservableObject{
//
//    @Published var datas = [dataType]()
//
//    init() {
//
//        let db = Firestore.firestore()
//
//        db.collection("Food").getDocuments { (snap, err) in
//
//            if err != nil{
//
//                print((err?.localizedDescription)!)
//                return
//            }
//
//            for i in snap!.documents{
//
//                let id = i.documentID
//                let Name = i.get("Name") as! String
//                let Cal = i.get("Cal") as! Int
//
//                self.datas.append(dataType(id: id, Name: Name, Cal: Cal))
//            }
//        }
//    }
//}




struct WalkingView : View {
    @ObservedObject private var diDatas = DogInfoFirebaseData
    @State private var duartionValue = ""
    @State private var updateRowIDDogInfo = "UhdbFdhVa1fLO4BihUq6"
    @State private var updateRowValueDogInfo = 0.0
    
    var body : some View{
        
        VStack{
          
            Text("Enter the duration of the walk")
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.title)
            
            
            TextField("Duration", text: $duartionValue).textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 200)

            
            Button(action: {
                self.addWalking()
            }) {
                Text("Save")
                
                
            }.padding()
                .frame(width: 100, height: 40)
                .foregroundColor(Color.white)
                .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .cornerRadius(5)
        }.navigationBarTitle("Walking")

        
        
        
    }
    
    func addWalking(){
          ActivityLogFirebaseData.addActivity(id:"UhdbFdhVa1fLO4BihUq6",
                Atype: "walking",
                duration: Int(self.duartionValue) ?? 0,
                date:DateFormatter.localizedString(from: NSDate() as Date,dateStyle: .short,timeStyle: .none))
    }
    
    
    
   
}

struct PlayingView : View {
        @ObservedObject private var diDatas = DogInfoFirebaseData
       @State private var duartionValue = ""
       @State private var updateRowIDDogInfo = "UhdbFdhVa1fLO4BihUq6"
       @State private var updateRowValueDogInfo = 0.0


    var body : some View{
        
        VStack{
          
            Text("Enter the duration of playtime")
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.title)
            
     TextField("Duration", text: $duartionValue).textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)

            
            Button(action: {
                self.addPlaying()
            }) {
                Text("Save")
                
                
            }.padding()
                .frame(width: 100, height: 40)
                .foregroundColor(Color.white)
                .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .cornerRadius(5)
        }.navigationBarTitle("Playing")

        
        
        
    }
    
    
    func addPlaying(){
           ActivityLogFirebaseData.addActivity(id:"UhdbFdhVa1fLO4BihUq6",
                 Atype: "playing",
                 duration: Int(self.duartionValue) ?? 0,
                 date:DateFormatter.localizedString(from: NSDate() as Date,dateStyle: .short,timeStyle: .none))
     }
   
}



struct RunningView : View {
    @ObservedObject private var diDatas = DogInfoFirebaseData
       @State private var duartionValue = ""
       @State private var updateRowIDDogInfo = "UhdbFdhVa1fLO4BihUq6"
       @State private var updateRowValueDogInfo = 0.0

    
    var body : some View{
        
        VStack{
          
            Text("Enter the duration of the run")
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.title)
            
            TextField("Duration", text: $duartionValue).textFieldStyle(RoundedBorderTextFieldStyle())
                          .frame(width: 200)
            
            
            Button(action: {
                self.addRunning()
                
            }) {
                Text("Save")
                
                
            }.padding()
                .frame(width: 100, height: 40)
                .foregroundColor(Color.white)
                .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .cornerRadius(5)
        }.navigationBarTitle("Running")

        
        
        
    }
    
    func addRunning(){
              ActivityLogFirebaseData.addActivity(id:"UhdbFdhVa1fLO4BihUq6",
                    Atype: "running",
                    duration: Int(self.duartionValue) ?? 0,
                    date:DateFormatter.localizedString(from: NSDate() as Date,dateStyle: .short,timeStyle: .none))
        }
    
   
}


struct SetTargetView : View {

    @ObservedObject private var diDatas = DogInfoFirebaseData
      @State private var activityValue = ""
      @State private var updateRowIDDogInfo = "UhdbFdhVa1fLO4BihUq6"
      @State private var updateRowValueDogInfo = 0.0
    
    var body : some View{
        
        VStack{
          
            Text("Set a time duration target (in minutes)")
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.title)
            
            TextField("Duration", text: $activityValue).textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 200)
            
            
            
            Button(action: {
                 self.saveActivityButton()
            }) {
                Text("Save")
                
                
            }.padding()
                .frame(width: 100, height: 40)
                .foregroundColor(Color.white)
                .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .cornerRadius(5)
        }.navigationBarTitle("Running")

        
        
        
    }
    
    func saveActivityButton() {
        DogInfoFirebaseData.updateActivityTarget(id: self.updateRowIDDogInfo, targetActivityUpdate: Int(self.activityValue) ?? 0)
       
       //self.calValue = ""
        
    }
    
   
}



