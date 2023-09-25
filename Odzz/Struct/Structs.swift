//
//  Structs.swift
//  Odzz
//
//  Created by Connor Welge on 25.09.23.
//

import Foundation
import SwiftUI

struct Student: Identifiable {
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var age: Int
}
