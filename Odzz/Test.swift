//
//  Test.swift
//  Xcode Test App
//
//  Created by Connor Welge on 25.09.23.
//

import Foundation
import SwiftUI

struct Test: View {
    private var name: String = ""
    private var firstName: String = ""
    private var lastName: String = ""
    private var age: Double
    
    init(Benutzername iName: String) {
        let iAge: Double = 0
        self.age = iAge
        
        let testName: String = "Hallo \(iName) \(Int(age))"
        self.name = testName
    }
    
    init(Alter iAge: Double, Benutzername iName: String) {
        let age: Double = iAge
        self.age = age
        
        let name: String = iName
        self.name = name
    }
    
    init(Alter iAge: Double, Vorname iFirstName: String, Nachname iLastName: String) {
        let age: Double = iAge
        self.age = age
        
        let firstName: String = iFirstName
        self.firstName = firstName
        
        let lastName: String = iLastName
        self.lastName = lastName
    }
    
    var body: some View {
        HStack {
            if(age < 20) {
                Text("Hallo Digga")
            } else if firstName == "" {
                Text("Hallo \(name), du bist \(Int(age)) Jahre altr")
            } else {
                Text("Du bist \(firstName) \(lastName) und du bist \(Int(age)) Jahre alt")
            }
        }
    }
}


#Preview {
//    Test(Benutzername: "Connor")
    Test(Alter: 16, Benutzername: "Connor")
}
