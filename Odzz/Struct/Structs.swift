//
//  Structs.swift
//  Odzz
//
//  Created by Connor Welge on 25.09.23.
//

import Foundation
import SwiftUI

/// A struct that represents a person.
struct Student: Identifiable, Hashable, Codable {
    
    /// The ID of the person.
    var id: UUID = UUID()
    
    /// The first name of the person.
    var firstName: String
    
    /// The last name of the person.
    var lastName: String
    
    /// The age of the person.
    var age: Int
}
