//
//  DogInfoFirebase.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/26/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


let DogInfoCollection = Firestore.firestore().collection("DogInfo")
let DogInfoFirebaseData = DogInfoFirebaseClass()

let MealInfoCollection = DogInfoCollection.document("UhdbFdhVa1fLO4BihUq6").collection("Meals")
let MealInfoFirebaseData = MealInfoFirebaseClass()


let ActivityCollection = DogInfoCollection.document("UhdbFdhVa1fLO4BihUq6").collection("ActivityLog")
let ActivityLogFirebaseData = ActivityLogFirebaseClass()

let MedLogCollection = DogInfoCollection.document("UhdbFdhVa1fLO4BihUq6").collection("Meds")
let MedLogFirebaseData = MedLogFirebaseClass()



class MealInfoFirebaseClass : ObservableObject {
    @Published var data = [Meal]()
    
    init() {
        readMealData()
    }
    
    func addMeal(id: String, name: String, cals: Int, date: String) {
       MealInfoCollection.addDocument(data: ["name" : name,"cals":cals,"date":date])
    }
    
    func getDailyCalories() -> Int {
        var dailyCalories = Int()
        for meal in self.data {
            
            if
                meal.date == DateFormatter.localizedString(from: NSDate() as Date,dateStyle: .short,timeStyle: .none)
                
            {dailyCalories += meal.cals}
            
            
        }
        return dailyCalories
    }
    
    
    func readMealData() {
        MealInfoCollection.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("read data success")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                // Real time create from server
                if (diff.type == .added) {
                    let mealData = Meal(id: diff.document.documentID, name:diff.document.get("name") as! String, cals:diff.document.get("cals") as! Int, date: diff.document.get("date") as! String)
                    self.data.append(mealData)
                }
                
                // Real time modify from server
                if (diff.type == .modified) {
                    self.data = self.data.map { (eachData) -> Meal in
                        var data = eachData
                        if data.id == diff.document.documentID {
                            data.cals = diff.document.get("cals") as! Int
                            data.name = diff.document.get("name") as! String
                            data.date = diff.document.get("date") as! String
                            return data
                        }else {
                            return eachData
                        }
                    }
                }
            }
        }
    }
}



class ActivityLogFirebaseClass : ObservableObject{
    @Published var Adata = [ActivityLog]()
    
    init(){
        readActivityData()
    }
    
    
    func addActivity(id: String, Atype: String, duration: Int, date: String){
        ActivityCollection.addDocument (data: ["ActivityType" : Atype, "Duration" : duration, "date" : date] )
    }
    
    
    func getDailyActivity() -> Int{
        var dailyActivity = Int()
        for activity in self.Adata{
            
            
            
            if
            activity.date == DateFormatter.localizedString(from: NSDate() as Date,dateStyle: .short,timeStyle: .none)
                          
                    
            
            {dailyActivity += activity.duration}
        }
        return dailyActivity
    }
    
    
    func  readActivityData() {
       ActivityCollection.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("read data success")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                // Real time create from server
                if (diff.type == .added) {
                    let activityData = ActivityLog(id: diff.document.documentID, Atype:diff.document.get("ActivityType") as! String, duration:diff.document.get("Duration") as! Int, date: diff.document.get("date") as! String)
                    self.Adata.append(activityData)
                }
                
                // Real time modify from server
                if (diff.type == .modified) {
                    self.Adata = self.Adata.map { (eachData) -> ActivityLog in
                        var Adata = eachData
                        if Adata.id == diff.document.documentID {
                            Adata.Atype = diff.document.get("ActivityType") as! String
                            Adata.duration = diff.document.get("Duration") as! Int
                            Adata.date = diff.document.get("date") as! String
                            return Adata
                        }else {
                            return eachData
                        }
                    }
                }
            }
        }
    }

    
    
}




class MedLogFirebaseClass: ObservableObject{
    @Published var MedLogData = [Meds]()
    
    init(){
        readMedLogData()
    }
    
    func addMed (id:String ,freq: Int, medName:String, time: String ){
        MedLogCollection.addDocument(data: ["freq": freq,"medName": medName, "time": time ])
    }
    
    func  readMedLogData() {
        MedLogCollection.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("read med data success")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                // Real time create from server
                if (diff.type == .added) {
                    let medLogData = Meds(id: diff.document.documentID, freq:diff.document.get("freq") as! Int, medName:diff.document.get("medName") as! String,
                        time: diff.document.get("time") as! String)
                    self.MedLogData.append(medLogData)
                }
                
                // Real time modify from server
                if (diff.type == .modified) {
                    self.MedLogData = self.MedLogData.map { (eachData) -> Meds in
                        var MedLogData = eachData
                        if MedLogData.id == diff.document.documentID {
                            MedLogData.freq = diff.document.get("Freq") as! Int
                            MedLogData.medName = diff.document.get("medName") as! String
                            MedLogData.time = diff.document.get("time") as! String
                            return MedLogData
                        }else {
                            return eachData
                        }
                    }
                }
            }
        }
    }
    
}

class DogInfoFirebaseClass: ObservableObject{
    
    @Published var didata = [DogInfoDataType]()
    
    init(){
        readData()
    }

    
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func createDataDogInfo(targetC:Int) {
          // To create or overwrite a single document
          DogInfoCollection.document().setData(["id" : DogInfoCollection.document().documentID,"targetCals":targetC])
          { (err) in
              if err != nil {
                  print((err?.localizedDescription)!)
                  return
              }else {
                  print("create data success")
              }
            
           
                
          }
      }
      
    
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func updateDataDogInfo(id: String, targetCalsUpdate: Int) {
        DogInfoCollection.document(id).updateData(["targetCals":targetCalsUpdate]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("update data success")
            }
        }
    }
    
    
    
    func updateActivityTarget(id: String, targetActivityUpdate: Int) {
        DogInfoCollection.document(id).updateData(["targetActivity":targetActivityUpdate]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("update data success")
            }
        }
    }
    
    
    
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func updateDogName(id: String, DogNameUpdate:String) {
           DogInfoCollection.document(id).updateData(["name":DogNameUpdate]) { (err) in
               if err != nil {
                   print((err?.localizedDescription)!)
                   return
               }else {
                   print("update name success")
               }
           }
       }
    
    func updateDogBDay(id: String, DogBDayUpdate:String) {
            DogInfoCollection.document(id).updateData(["birthday":DogBDayUpdate]) { (err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }else {
                    print("update birthday success")
                }
            }
        }
     
    
       func updatecNum(id: String, cNumUpdate:Int) {
               DogInfoCollection.document(id).updateData(["cNum":cNumUpdate]) { (err) in
                   if err != nil {
                       print((err?.localizedDescription)!)
                       return
                   }else {
                       print("update chip number success")
                   }
               }
           }
        
    func updatevNum(id: String, vNumUpdate:Int) {
                 DogInfoCollection.document(id).updateData(["vNum":vNumUpdate]) { (err) in
                     if err != nil {
                         print((err?.localizedDescription)!)
                         return
                     }else {
                         print("update license number success")
                     }
                 }
             }
    
    
    
   func readData() {
       DogInfoCollection.addSnapshotListener { (documentSnapshot, err) in
           if err != nil {
               print((err?.localizedDescription)!)
               return
           }else {
               print("read data for DogInfo success")
           }
            
           documentSnapshot!.documentChanges.forEach { diff in
//            let subCollection = DogInfoCollection.document(diff.document.documentID).collection("Meals");)
            
            //let mealRec = DogInfoDataType.Meals
            print(diff.document.get("Meals"))
//            var currentMeals = [Meal]()
//            for MealDoc in subCollection {
                
//                let mealDict = MealRec as! NSDictionary
//                let dateVal = mealDict["date"] as! Timestamp
//                let meal = Meal(name: mealDict["name"] as! String, cals: mealDict["cals"] as! Int , date: dateVal.dateValue() as NSDate)
            
            
                //currentMeals.append(meal)
            //            }
            // Real time create from server
            print(diff.type == .modified)
            if (diff.type == .added) {
                print(diff.document.data())
                let DogInfoData = DogInfoDataType (id: diff.document.documentID,
                                                   targetCals:Int(truncating: diff.document.get("targetCals") as! NSNumber),
                                                   DogName:diff.document.get("name") as! String,
                                                   DogBDate:diff.document.get("birthday") as! String,
                                                   
                                                   targetActivity:Int(truncating: diff.document.get("targetActivity") as! NSNumber),
                                                   cNum: Int(truncating: diff.document.get("cNum") as! NSNumber),
                                                   lNum: Int(truncating: diff.document.get("lNum") as! NSNumber)
                                                    
                    
                    
 //          Meals: currentMeals
                )
                   self.didata.append(DogInfoData)
               }
               
               // Real time modify from server
               if (diff.type == .modified) {
                   self.didata = self.didata.map { (eachData) -> DogInfoDataType in
                       var didata = eachData
                       if didata.id == diff.document.documentID {
                           didata.targetCals = diff.document.get("targetCals") as! Int
                           return didata
                       }else {
                           return eachData
                       }
                   }
               }
            
            
            
            // Real time modify from server
            if (diff.type == .modified) {
                self.didata = self.didata.map { (eachData) -> DogInfoDataType in
                    var didata = eachData
                    if didata.id == diff.document.documentID {
                        didata.targetActivity = diff.document.get("targetActivity") as! Int
                        return didata
                    }else {
                        return eachData
                    }
                }
            }

            
            
           }
       }
   }

    
    
    
}
