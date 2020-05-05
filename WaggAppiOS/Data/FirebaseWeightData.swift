//
//  FirebaseWeightData.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/23/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

//import Foundation
//import FirebaseFirestore
//import Firebase
//
//let dbCollection = Firestore.firestore().collection("UserWeight")
//let firebaseData = FirebaseData()
//
//class FirebaseData: ObservableObject {
//
//@Published var data = [WeightDataType]()
//
//init() {
//    readData()
//}
//
//
//func createData(w1:Int) {
//    // To create or overwrite a single document
//    dbCollection.document().setData(["id" : dbCollection.document().documentID,"weight":w1]) { (err) in
//        if err != nil {
//            print((err?.localizedDescription)!)
//            return
//        }else {
//            print("create data success")
//        }
//    }
//}
//
//
//
//     func readData() {
//            dbCollection.addSnapshotListener { (documentSnapshot, err) in
//                if err != nil {
//                    print((err?.localizedDescription)!)
//                    return
//                }else {
//                    print("read data success")
//                }
//
//                documentSnapshot!.documentChanges.forEach { diff in
//                    // Real time create from server
//                    if (diff.type == .added) {
//                        let weightData = WeightDataType(id: diff.document.documentID, weight: diff.document.get("weight") as! Int)
//                        self.data.append(weightData)
//                    }
//
//                    // Real time modify from server
//                    if (diff.type == .modified) {
//                        self.data = self.data.map { (eachData) -> WeightDataType in
//                            var data = eachData
//                            if data.id == diff.document.documentID {
//                                data.weight = diff.document.get("weight") as! Int
//                                return data
//                            }else {
//                                return eachData
//                            }
//                        }
//                    }
//                }
//            }
//        }
//
//
//        func deleteData(datas: FirebaseData ,index: IndexSet) {
//            let id = datas.data[index.first!].id
//            dbCollection.document(id).delete { (err) in
//                if err != nil {
//                    print((err?.localizedDescription)!)
//                    return
//                }else {
//                    print("delete data success")
//                }
//                datas.data.remove(atOffsets:index)
//            }
//        }
//
//
//    func updateData(id: String, weight1: Int) {
//            dbCollection.document(id).updateData(["weight":weight1]) { (err) in
//                if err != nil {
//                    print((err?.localizedDescription)!)
//                    return
//                }else {
//                    print("update data success")
//                }
//            }
//        }
//    }
//
//
//
//
//

import Firebase
import FirebaseFirestore

let dbCollection = Firestore.firestore().collection("UserWeight")
let firebaseData = FirebaseData()

class FirebaseData: ObservableObject {
    
    @Published var data = [WeightDataType]()
    
    init() {
        readData()
    }
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func createData(w1:Double) {
        // To create or overwrite a single document
        dbCollection.document().setData(["id" : dbCollection.document().documentID,"weight":w1]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("create data success")
            }
        }
    }
    
    // Reference link : https://firebase.google.com/docs/firestore/query-data/listen
    func readData() {
        dbCollection.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("read data success")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                // Real time create from server
                if (diff.type == .added) {
                    let weightData = WeightDataType(id: diff.document.documentID, weight:Double(diff.document.get("weight") as! NSNumber))
                    self.data.append(weightData)
                }
                
                // Real time modify from server
                if (diff.type == .modified) {
                    self.data = self.data.map { (eachData) -> WeightDataType in
                        var data = eachData
                        if data.id == diff.document.documentID {
                            data.weight = diff.document.get("weight") as! Double
                            return data
                        }else {
                            return eachData
                        }
                    }
                }
            }
        }
    }
    
    //Reference link: https://firebase.google.com/docs/firestore/manage-data/delete-data
    func deleteData(datas: FirebaseData ,index: IndexSet) {
        let id = datas.data[index.first!].id
        dbCollection.document(id).delete { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("delete data success")
            }
            datas.data.remove(atOffsets:index)
        }
    }
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func updateData(id: String, weighttxt: Double) {
        dbCollection.document(id).updateData(["weight":weighttxt]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("update data success")
            }
        }
    }
    
    
}
