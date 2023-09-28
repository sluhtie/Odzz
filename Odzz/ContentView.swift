//
//  ContentView.swift
//  Odzz
//
//  Created by Connor Welge on 25.09.23.
//

import SwiftUI

struct ContentView: View {
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
            }
        }
        
    }
}

#Preview {
    ContentView()
}
