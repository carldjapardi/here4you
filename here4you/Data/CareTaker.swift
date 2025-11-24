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
    var rating: Double
    var hourlyRate: Double
    var email: String
    var region: String
    @Relationship(deleteRule: .cascade, inverse: \Appointment.careTaker)
    var appointments: [Appointment]
    @Relationship(deleteRule: .cascade, inverse: \MessagesList.participant)
    var messageThreads: [MessagesList]
    
    init(
        id: UUID = UUID(),
        name: String,
        desc: String,
        rating: Double,
        hourlyRate: Double,
        email: String,
        region: String,
        appointments: [Appointment] = [],
        messageThreads: [MessagesList] = []
    ) {
        self.id = id
        self.name = name
        self.desc = desc
        self.rating = rating
        self.hourlyRate = hourlyRate
        self.email = email
        self.region = region
        self.appointments = appointments
        self.messageThreads = messageThreads
    }
}
