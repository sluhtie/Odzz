//
//  Test.swift
//  Xcode Test App
//
//  Created by Connor Welge on 25.09.23.
//

import Foundation
import SwiftUI

/// Hallo Welt
/// - Parameters:
///   - Alter: The food for the sloth to eat.
///   - Vorname: The quantity of the food for the sloth to eat.
///   - Nachname: The quantity of the food for the sloth to be cool.
struct Test: View {
    @Environment(\.dismiss) var dismiss
    
    private var firstName: String = ""
    private var lastName: String = ""
    private var age: Int
    
    /// Hallo Welt1
    init(Alter iAge: Int, Vorname iFirstName: String, Nachname iLastName: String) {
        
        /// Hallo Jake4
        let age: Int = iAge
        self.age = age
        
        /// Hallo Jake2
        let firstName: String = iFirstName
        self.firstName = firstName
        
        /// Hallo Jake
        let lastName: String = iLastName
        self.lastName = lastName
    }
    
    /// Hallo Welt2
    init(Vorname iFirstName: String, Nachname iLastName: String) {
        
        /// Hallo Baum
        let firstName: String = iFirstName
        self.firstName = firstName
        
        /// Hallo Baum2
        let lastName: String = iLastName
        self.lastName = lastName
        
        self.age = 0
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
