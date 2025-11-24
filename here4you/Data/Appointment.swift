//
//  ApptList.swift
//  here4you
//
//  Created by Carl on 11/21/25.
//

import SwiftData
import Foundation

@Model
final class Appointment {
    enum Status: String, Codable, CaseIterable {
        case scheduled
        case completed
        case cancelled
    }
    
    @Attribute(.unique) var id: UUID
    var user: User
    var careTaker: CareTaker
    var dateAndTime: Date
    var location: String
    var status: Status
    var notes: String?
    
    init(
        id: UUID = UUID(),
        user: User,
        careTaker: CareTaker,
        dateAndTime: Date,
        location: String,
        status: Status = .scheduled,
        notes: String? = nil
    ) {
        self.id = id
        self.user = user
        self.careTaker = careTaker
        self.dateAndTime = dateAndTime
        self.location = location
        self.status = status
        self.notes = notes
    }
}
