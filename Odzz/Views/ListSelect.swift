//
//  ListSelect.swift
//  Odzz
//
//  Created by Connor Welge on 26.09.23.
//

import Foundation
import SwiftUI

struct ListSelect: View {
    
    @State private var students: [Student] = [
        Student(firstName: "Connor", lastName: "Welge", age: 16),
        Student(firstName: "Niklas", lastName: "Rittel", age: 16),
        Student(firstName: "Martin", lastName: "Kloster", age: 66),
        Student(firstName: "Mertel", lastName: "Specht", age: 28),
        Student(firstName: "Luisa", lastName: "Gottland", age: 12),
        Student(firstName: "Omega", lastName: "Küppner", age: 1934),
        Student(firstName: "Olaf", lastName: "Schulz", age: 50)
    ]
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: String = ""
    
    
    var body: some View {

        NavigationView() {
            VStack {
                List {
                    ForEach(students) { student in
                        
                        NavigationLink(
                            destination: Test(Alter: student.age, Vorname: student.firstName, Nachname: student.lastName),
                            label: { Text("\(student.firstName) \(student.lastName), Alter: \(student.age)") }
                        )
//                        .navigationBarTitle("Hauptansicht", displayMode: .inline)
                    }
                    .onDelete { offsets in
                        students.remove(atOffsets: offsets)
                    }
                }
            
                Form {
                    Section(header: Text("Schüler Hinzufügen")) {
                        TextField("Vorname", text: $firstName)
                        TextField("Nachname", text: $lastName)
                        TextField("Alter", text: $age)
                            .keyboardType(.numberPad)
                        Button(action: {
                            if let age = Int(age) {
                                let newStudent = Student(firstName: firstName, lastName: lastName, age: age)
                                students.append(newStudent)
                                clearFields()
                            }
                        }) { Text("Hinzufügen") }
                    }
                }
            }
            
            .navigationTitle("Alle Schüler")
        }
    }
    
    private func clearFields() {
        firstName = ""
        lastName = ""
        age = ""
    }
    
}

#Preview {
    ListSelect()
}

