//
//  Test.swift
//  Xcode Test App
//
//  Created by Connor Welge on 25.09.23.
//

import Foundation
import SwiftUI

struct Test: View {
    @Environment(\.dismiss) var dismiss
    
    private var firstName: String = ""
    private var lastName: String = ""
    private var age: Int
    
    init(Alter iAge: Int, Vorname iFirstName: String, Nachname iLastName: String) {
        let age: Int = iAge
        self.age = age
        
        let firstName: String = iFirstName
        self.firstName = firstName
        
        let lastName: String = iLastName
        self.lastName = lastName
    }
    
    var body: some View {
        
        Button("Zurück", systemImage: "chevron.backward") {
            dismiss()
        }
//        .navigationTitle("Detail View")
        .navigationBarBackButtonHidden(true)
        
        NavigationView {
            HStack {
                if(age < 20) {
                    Text("Hallo \(firstName) \(lastName), du bist \(Int(age)) Jahre alt")
                        .padding()
                        .background(.red)
                        .foregroundStyle(.white)
                } else {
                    Text("Hallo \(firstName) \(lastName), du bist \(Int(age)) Jahre alt")
                        .padding()
                        .background(.green)
                        .foregroundStyle(.white)
                }
            }
        }
        
    }
}


#Preview {
//    Test(Benutzername: "Connor")
    Test(Alter: 16, Vorname: "Connor", Nachname: "Welge")
}
