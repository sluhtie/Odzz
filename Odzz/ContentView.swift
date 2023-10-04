//
//  ContentView.swift
//  Odzz
//
//  Created by Connor Welge on 25.09.23.
//

import SwiftUI

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    
                    NavigationLink(destination: CustomSelect() .navigationBarBackButtonHidden(true)) {
                        Text("Custom")
                    }
                    
                    NavigationLink(destination: ListSelect() .navigationBarBackButtonHidden(true)) {
                        Text("List")
                    }
                }
                
                Section {
                    List {
                        ForEach(people, id: \.firstname) { person in
                            Text("\(person.firstname) \(person.lastname)")
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
