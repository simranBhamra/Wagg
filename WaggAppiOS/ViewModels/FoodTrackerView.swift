//
//  FoodTrackerView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/1/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI
import Firebase
import SwiftUICharts

 

struct FoodTrackerView: View {
    @State var progressValue: Float = 0.0
    @ObservedObject var data = getData()
   //  @ObservedObject var DogInfodata = getDogInfo()
    @State private var searchTerm: String = ""
    @ObservedObject private var diDatas = DogInfoFirebaseData
    @ObservedObject private var mealDatas = MealInfoFirebaseData
    
       
    
   
    @State var isProfileViewPresented = false
    
    
    
    var body: some View {
               ScrollView (.vertical, showsIndicators: false){
        ZStack{
            //NavigationView{
            
            VStack{
            
                VStack(alignment: .leading){
                    Spacer()
                    Text("Meal progress")
                       .font(.title)
                    Spacer()
                    Text("\(String(describing: mealDatas.getDailyCalories()))" + "/" +
                        "\(diDatas.didata[0].targetCals)")
                    
                   
          
  
                   
                   
                    FoodProgressBar(value: (Float(mealDatas.getDailyCalories())/Float(diDatas.didata[0].targetCals))).frame(width: 300, height: 20)
                   
//                    
//                    Button(action: {
//                        self.startProgressBar()
//                    }) {
//                        Text("Start Progress")
//                    }.padding()
//                    
//                    Button(action: {
//                        self.resetProgressBar()
//                    }) {
//                        Text("Set Target (Reset)")
//                    }
                    Spacer()
                    
                }.frame(width: 350, height: 200)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .padding(.bottom)
                    .padding(.top)
           
                
                

//                List{
//                    Text("Search")
//                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))ºª
//                        .font(.title)
//                        .padding()
//                    SearchBar(text: $searchTerm);
//
//                    ForEach(self.foods.filter{
//                        self.searchTerm.isEmpty ? true :
//                            $0.localizedCaseInsensitiveContains(self.searchTerm)
//
//                    }, id: \.self){ foods in Text(foods)}
//                }
                
            
                CustomSearchBar(data: self.$data.datas)
                .frame(width: 350, height: 350)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.body)
                    .padding(.bottom)
                
                
              

                 
//                List{
//                                   ForEach(diDatas.didata){ didata in
//                                       HStack {
//                                           Button(action: {
//
//                                            Text("Butts")
//                                           }) {
//                                               Text(didata.targetCals)
//                                           }
//                                       }
//                                   }
//                                   }
//                               }
//
                NavigationLink("Set Target", destination: SetTarget())
                .frame(width: 150, height: 35)
                .foregroundColor(Color.white)
                .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .cornerRadius(15)
              
            } .padding(.leading, 10)
                   .padding(.trailing, 10)

                   .padding(.bottom,10 )
            .navigationBarTitle("Food Tracking").navigationBarItems(trailing:
                
                
                
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        print("Button tapped")
                        self.isProfileViewPresented = true
                    }) {
                        Image(systemName:  "person.circle.fill").font(.title).foregroundColor(.white)
                    }.sheet(isPresented: $isProfileViewPresented, content: {ProfileView()})
                }
            )
        //}
    }
        }
        
    }
    
    
        func startProgressBar() {
            self.progressValue += 0.50
           
    //        for _ in 0...10 {
    //            self.progressValue += 0.050
    //        }
        }
        
        func resetProgressBar() {
            
            self.progressValue = 0.0
        }
    
}

struct FoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        FoodTrackerView()
       
    }
}


struct CustomSearchBar : View {

    @State var txt = ""
    @Binding var data : [dataType]

    var body : some View{

        VStack(alignment: .leading){
            Text("Add your dogs food")
            .font(.title)
                .padding(.bottom)
            HStack{

                TextField("Search Food ", text: self.$txt)
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.subheadline)
                  Spacer()

                if self.txt != ""{

                    Button(action: {

                        self.txt = ""

                    }) {

                        Text("Cancel")
                    }
                    .foregroundColor(.black)
                    

                }
                  

            }//.padding()
            //.edgesIgnoringSafeArea(.all)

            if self.txt != ""{

                if  self.data.filter({$0.Name.lowercased().contains(self.txt.lowercased())}).count == 0{

                    Text("No Results Found").foregroundColor(Color.black.opacity(0.5)).padding()
                }
                else{

                List(self.data.filter{$0.Name.lowercased().contains(self.txt.lowercased())}){i in

                    NavigationLink(destination: Detail(data: i)) {

                        Text(i.Name)
                    }


                    }
                    
                }

            }


        }
        .background(Color.white)
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

class getData : ObservableObject{

    @Published var datas = [dataType]()

    init() {

        let db = Firestore.firestore()

        db.collection("Food").getDocuments { (snap, err) in

            if err != nil{

                print((err?.localizedDescription)!)
                return
            }

            for i in snap!.documents{

                let id = i.documentID
                let Name = i.get("Name") as! String
                let Cal = i.get("Cal") as! Int

                self.datas.append(dataType(id: id, Name: Name, Cal: Cal))
            }
        }
    }
}

//class getDogInfo : ObservableObject{
//
//    @Published var dogData = [DogInfoType]()
//
//    init() {
//
//        let db = Firestore.firestore()
//
//        db.collection("DogInfo").getDocuments { (snap, err) in
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
////                let Birthday = i.get("birthday") as! Date
//                let Name = i.get("name") as! String
//                let targetCals = i.get("targetCals") as! Int
//
//                self.dogData.append(DogInfoType(id: id, Name: Name, targetCals: targetCals))
//            }
//        }
//    }
//}

//struct DogInfoType : Identifiable {
//    var id : String
//    var Name : String
//    //var Birthday : Date
//    var targetCals : Int
//}

struct dataType : Identifiable {

    var id : String
    var Name : String
    var Cal: Int
   
}

struct Detail : View {

    var data : dataType

    var body : some View{
       
        VStack(alignment: .leading) {
              Text(" \(data.Name)")
                .font(.title)
                .padding(.bottom)
          
              Text("Calories per cup: \(data.Cal)")
            Text("Crude Protien")
            Text("Crude Fat")
            Text("Moisture")
            Text("DHA")
            Text("Calcium")
            Text("Omega 3")
            Text("Omega 6")
               
                .padding(.bottom)
            
            Button(action: {
                self.addMealSave()
            }) {
                Text("Add to Meals")
                
                 
            }.padding()
                .frame(width: 400, height: 40)
                .foregroundColor(Color.white)
                .background(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .cornerRadius(5)
           


          }
    
           
       // Text( "Name \(data.Name) ")
      //  .font(.title)
       //Text("Calories per cup: \(data.Cal)" )
            
        
        
    }
    
    func addMealSave() {
        MealInfoFirebaseData.addMeal(id:"UhdbFdhVa1fLO4BihUq6",name: data.Name,cals:data.Cal,date:DateFormatter.localizedString(from: NSDate() as Date,dateStyle: .short,timeStyle: .none))
    }
}


struct SetTarget : View{
    @ObservedObject private var diDatas = DogInfoFirebaseData
    @State private var calValue = ""
    @State private var updateRowIDDogInfo = "UhdbFdhVa1fLO4BihUq6"
    @State private var updateRowValueDogInfo = 0.0
   // @State private var isUpdateDogInfo = false
    
    var body : some View{
    VStack(alignment: .leading){
        
        Text("Set Calorie Target")
        .font(.title)
        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
        .padding(.top)
        
        TextField("Enter Target Calories", text: $calValue).textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 200)
        
        Button(action: {
                         self.saveButton()
                     }) {
                         Text("Save")
                     }
        
        }
     
        
    }
    
    
    func saveButton() {
        DogInfoFirebaseData.updateDataDogInfo(id: self.updateRowIDDogInfo, targetCalsUpdate: Int(self.calValue) ?? 0)
       
       //self.calValue = ""
        
    }
    

}
