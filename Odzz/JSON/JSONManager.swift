//
//  JSONManager.swift
//  Odzz
//
//  Created by Connor Welge on 28.09.23.
//

import Foundation

struct Person: Codable {
    let firstname, lastname: String
    let age: Int
    let country, state: String
    let grade: Double
    
    // Generate samples
    static let allPeople: [Person] = Bundle.main.decode(file: "students.json")
    static let samplePerson: Person = allPeople[0]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
