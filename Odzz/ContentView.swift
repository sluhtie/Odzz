//
//  ContentView.swift
//  Odzz
//
//  Created by Connor Welge on 25.09.23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedName: String = ""
    @State private var selectedAge: Int = 0
    let names = ["Alice", "Bob", "Charlie"]
    let ageRange = 1...100 // Adjust the range as needed
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Wähle einen namen", selection: $selectedName) {
                        ForEach(names, id: \.self) { name in
                            Text(name).tag(name)
                        }
                    }
                }
                
                if selectedName != "" {
                    Section {
                        Text("Name: \(selectedName)")
                    }
                    
                    Section {
                        Picker("Wähle ein Alter", selection: $selectedAge) {
                            ForEach(ageRange, id: \.self) { age in
                                Text("\(age)").tag(age)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    
                    Section {
                        Text("Alter: \(selectedAge)")
                    }
                }
                
                if selectedAge > 0 {
                    Section {
                        NavigationLink(destination: Test(Alter: Double(selectedAge), Benutzername: selectedName)) {
                            Text("Show Another View")
                        }
                    }
                }
            }
            .navigationTitle("Wähle dein Chrakter")
        }
    }
}

#Preview {
    ContentView()
}
