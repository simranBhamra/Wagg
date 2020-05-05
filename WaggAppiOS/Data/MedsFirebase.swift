//
//  MedsFirebase.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/26/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//
import Foundation
import Firebase
import FirebaseFirestore


let MedicationCollection = Firestore.firestore().collection("Medication")
let MedicationFirebaseData = FirebaseData()


class MedicationFirebaseClass: ObservableObject{
    
    @Published var medicationdata = [MedicationDataType]()
    
    init(){
        readData()
    }
    
   func readData() {
       dbCollection.addSnapshotListener { (documentSnapshot, err) in
           if err != nil {
               print((err?.localizedDescription)!)
               return
           }else {
               print("read data for DogInfo success")
           }
           
           documentSnapshot!.documentChanges.forEach { diff in
               // Real time create from server
               if (diff.type == .added) {
                   let MedicationData = MedicationDataType (id: diff.document.documentID,
                    
                                                    MedType: diff.document.get("MedType") as! String
                   
                
                
                )
                   self.medicationdata.append(MedicationData)
               }
               
               // Real time modify from server
               if (diff.type == .modified) {
                   self.medicationdata = self.medicationdata.map { (eachData) -> MedicationDataType in
                       var medicationdata = eachData
                       if medicationdata.id == diff.document.documentID {
                          medicationdata.MedType = diff.document.get("MedType") as! String
                           return medicationdata
                       }else {
                           return eachData
                       }
                   }
               }
           }
       }
   }

    
    
    
}
