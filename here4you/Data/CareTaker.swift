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
    var location: String
    var hourlyRate: Double
    var phoneNumber: String
    @Relationship(deleteRule: .cascade, inverse: \Appointment.careTaker)
    var appointments: [Appointment]
    
    init(
        id: UUID = UUID(),
        name: String,
        desc: String,
        location: String,
        hourlyRate: Double,
        phoneNumber: String,
        appointments: [Appointment] = [],
    ) {
        self.id = id
        self.name = name
        self.desc = desc
        self.location = location
        self.hourlyRate = hourlyRate
        self.phoneNumber = phoneNumber
        self.appointments = appointments
    }
}
