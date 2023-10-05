//
//  ListSelect.swift
//  Odzz
//
//  Created by Connor Welge on 26.09.23.
//

import Foundation
import SwiftUI

struct ListSelect: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var students: [Student]
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: String = ""
    @State private var isPopoverVisible = false
    
    
    init() {
        var iStudents: [Student] = [
            Student(firstName: "Connor", lastName: "Welge", age: 16),
            Student(firstName: "Niklas", lastName: "Rittel", age: 16),
            Student(firstName: "Martin", lastName: "Kloster", age: 66),
            Student(firstName: "Mertel", lastName: "Specht", age: 28),
            Student(firstName: "Luisa", lastName: "Gottland", age: 12),
            Student(firstName: "Omega", lastName: "Küppner", age: 1934),
            Student(firstName: "Olaf", lastName: "S", age: 50)
        ]
        
        importStudentsFromJSON()
        
//        self.students = iStudents
        self._students = State(initialValue: iStudents)
        
        func importStudentsFromJSON() {
            let people: [Person] = Person.allPeople
            
            for person in people {
                iStudents.append(Student(firstName: person.firstname,
                                        lastName: person.lastname,
                                        age: person.age))
            }
        }
    }
    
    var body: some View {
        
        NavigationView() {
            VStack {
                List {
                    ForEach(students) { student in
                        
                        NavigationLink(
                            destination: Test(Alter: student.age, Vorname: student.firstName, Nachname: student.lastName),
                            label: {
                                VStack(alignment: .leading) {
                                    Text("\(student.firstName) \(student.lastName)")
                                    Text("Alter: \(student.age)")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                            }
                        )
//                        .navigationBarTitle("Hauptansicht", displayMode: .inline)
                    }
                    .onDelete { offsets in
                        students.remove(atOffsets: offsets)
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                    }
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button(action: {
                        isPopoverVisible.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .popover(isPresented: $isPopoverVisible, content: {
                        VStack {
                            TextField("First Name", text: $firstName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            TextField("Last Name", text: $lastName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            TextField("Age", text: $age)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .padding()
                            Button(action: {
                                // Validate age as an integer
                                if let ageValue = Int(age) {
                                    let person = Student(firstName: firstName, lastName: lastName, age: ageValue)
                                    students.append(person)
                                    isPopoverVisible.toggle()
                                } else {
                                    // Handle invalid age input
                                    // You can display an alert or error message here
                                }
                            }) {
                                Text("Save")
                                    .padding(10)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                            .padding()
                        }
                        .padding()
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
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

