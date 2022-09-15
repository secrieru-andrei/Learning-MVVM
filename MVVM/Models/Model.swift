//
//  Model.swift
//  MVVM
//
//  Created by Secrieru Andrei on 13.09.2022.
//

import Foundation

enum Gender{
    case male
    case female
    case unspecified
}

struct Person {
    let name: String
    let surname: String?
    let birthday: Date?
    let gender: Gender
    let adress: String?
    var username = "Andrei"
    
    init(name:String,
         surname: String? = nil,
         birthday: Date? = nil,
         gender: Gender = .unspecified,
         adress: String? = nil){
        
        self.name = name
        self.surname = surname
        self.birthday = birthday
        self.gender = gender
        self.adress = adress
    }
}

