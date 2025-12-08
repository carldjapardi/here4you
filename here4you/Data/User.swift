//
//  User.swift
//  here4you
//
//  Created by Carl on 11/21/25.
//

import SwiftData
import Foundation

@Model
final class User {
    @Attribute(.unique) var id: UUID
    var name: String
    var location: String
    var phone: String
    @Relationship(deleteRule: .cascade, inverse: \Appointment.user)
    var appointments: [Appointment]
    
    init(
        id: UUID = UUID(),
        name: String,
        location: String = "",
        phone: String = "",
        appointments: [Appointment] = [],
    ) {
        self.id = id
        self.name = name
        self.location = location
        self.phone = phone
        self.appointments = appointments

    }
}
