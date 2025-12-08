//
//  profile.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftData
import Foundation

@Model
final class CareTaker {
    @Attribute(.unique) var id: UUID
    var name: String
    var desc: String
    @Relationship(deleteRule: .cascade, inverse: \Appointment.careTaker)
    var appointments: [Appointment]
    
    init(
        id: UUID = UUID(),
        name: String,
        desc: String,
        appointments: [Appointment] = [],
    ) {
        self.id = id
        self.name = name
        self.desc = desc
        self.appointments = appointments
    }
}
