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
    @Relationship(deleteRule: .cascade, inverse: \Appointment.user)
    var appointments: [Appointment]
    @Relationship(deleteRule: .cascade, inverse: \MessagesList.owner)
    var messageThreads: [MessagesList]
    
    init(
        id: UUID = UUID(),
        name: String,
        appointments: [Appointment] = [],
        messageThreads: [MessagesList] = []
    ) {
        self.id = id
        self.name = name
        self.appointments = appointments
        self.messageThreads = messageThreads
    }
}
