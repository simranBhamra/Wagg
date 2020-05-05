//
//  FirestoreSearchFood.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/22/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

//import SwiftUI
//import Firebase
//
//struct FirestoreSearchFood: View {
//
//    @ObservedObject var data = getData()
//
//    var body: some View {
//        NavigationView{
//
//            ZStack(alignment: .top){
//
//                GeometryReader{_ in
//
//                    // Home View....
//                    Text("Home")
//
//                }.edgesIgnoringSafeArea(.all)
//
//              CustomSearchBar(data: self.$data.datas).padding(.top)
//
//            }
//        }
//
//
//
//    }
//}
//
//struct FirestoreSearchFood_Previews: PreviewProvider {
//    static var previews: some View {
//         FirestoreSearchFood()
//    }
//}

//struct CustomSearchBar : View {
//
//    @State var txt = ""
//    @Binding var data : [dataType]
//
//    var body : some View{
//
//        VStack(spacing: 0){
//
//            HStack{
//
//                TextField("Search", text: self.$txt)
//
//                if self.txt != ""{
//
//                    Button(action: {
//
//                        self.txt = ""
//
//                    }) {
//
//                        Text("Cancel")
//                    }
//                    .foregroundColor(.black)
//
//                }
//
//            }.padding()
//
//            if self.txt != ""{
//
//                if  self.data.filter({$0.Name.lowercased().contains(self.txt.lowercased())}).count == 0{
//
//                    Text("No Results Found").foregroundColor(Color.black.opacity(0.5)).padding()
//                }
//                else{
//
//                List(self.data.filter{$0.Name.lowercased().contains(self.txt.lowercased())}){i in
//
//                    NavigationLink(destination: Detail(data: i)) {
//
//                        Text(i.Name)
//                    }
//
//
//                    }.frame(height: UIScreen.main.bounds.height / 5)
//                }
//
//            }
//
//
//        }.background(Color.white)
//        .padding()
//    }
//}
//
//class getData : ObservableObject{
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
//
//struct dataType : Identifiable {
//
//    var id : String
//    var Name : String
//    var Cal: Int
//   
//}
//
//struct Detail : View {
//
//    var data : dataType
//
//    var body : some View{
//
//        Text( "Name \(data.Name)  Calories per cup: \(data.Cal)" )
//        
//      
//    }
//}
