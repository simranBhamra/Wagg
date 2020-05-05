//
//  DogInfoDataType.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/26/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import Foundation

struct DogInfoDataType: Identifiable{
    var id: String
    var targetCals: Int
    var DogName: String
    var DogBDate: String
    var targetActivity: Int
    var cNum: Int
    var lNum: Int
    //var Meals: Array<Meal>
    
    
}

struct Meal: Identifiable {
   var id: String
    var name: String
    var cals: Int
    var date: String
}



struct ActivityLog: Identifiable{
    var id: String
    var Atype: String
    var duration: Int
    var date: String
}


struct Meds: Identifiable{
    var id: String
    var freq: Int
    var medName: String
    var time: String
}
