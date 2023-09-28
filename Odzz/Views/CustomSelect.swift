//
//  ContentView.swift
//  Odzz
//
//  Created by Connor Welge on 25.09.23.
//

import SwiftUI

struct CustomSelect: View {

    let availableStudents: [Student] = [
        Student(firstName: "Maria", lastName: "Hoffmann", age: 0),
        Student(firstName: "Maria", lastName: "Altenburg", age: 0),
        Student(firstName: "Lena", lastName: "Müller", age: 0)
    ]
    
    @State var selectedStudent = ""
    @State var selectedAge: Int?
    
    let ageRange = 1...100

    var body: some View {
        
        let defaultStudent: Student = availableStudents[0]
        
        NavigationView {
            Form {
                
                Section {
                    Text("\(defaultStudent.firstName)")
                    Text("\(defaultStudent.id)")
                    Text("\(selectedStudent)")
                }
                
                Section {
                    Picker("Wähle einen Namen", selection: $selectedStudent) {
                        ForEach(availableStudents) { student in
                            Text("\(student.firstName) \(student.lastName)").tag("\(student.id)")
                        }
                    }
                }
                
                Section {
                    Text("Name: \(selection.firstName) \(selection.lastName)")
                }
                
                
                
//                if selectedStudent == nil {
//                    var selection: Student = selectedStudent ?? Student(firstName: "", lastName: "", age: 0)
//                    
//                    Section {
//                        Text("Name: \(selection.firstName) \(selection.lastName)")
//                    }
//
//                    Section {
//                        Picker("Wähle ein Alter", selection: $selectedAge) {
//                            ForEach(ageRange, id: \.self) { age in
//                                Text("\(age)").tag(age)
//                            }
//                        }
//                        .pickerStyle(WheelPickerStyle())
//                    }
//
//                    if let age = selectedAge {
//                        Section {
//                            Text("Alter: \(age)")
//                        }
//                    }
//                }

//                if let age = selectedAge, let student = selectedStudent {
//                    Section {
//                        NavigationLink(destination: Text("Alter: \(age), Vorname: \(student.firstName), Nachname: \(student.lastName)")) {
//                            Text("Zeige eine andere Ansicht")
//                        }
//                    }
//                }
            }
            .navigationTitle("Wähle deinen Charakter")
            
//            Section {
//                var selected = availableStudents.first(where: String(Student.id) = String(selectedStudent))
//                if availableStudents.first(where: Student.id == selectedStudent) != "" {
//                    Text("true")
//                } else {
//                    Text("false")
//                }
//            }
        }
    }
}
