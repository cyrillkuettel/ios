//
//  Person.swift
//  SwiftProgrammers
//
//  Created by HSLU-N0004890 on 25.09.22.
//

import Foundation

class Person {
    var firstName : String
    var lastName : String
    var plz : Int
    
    init(firstName: String, lastName: String, plz: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.plz = plz
    }
}
