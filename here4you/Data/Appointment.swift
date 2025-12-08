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
    @Attribute(.unique) var id: UUID
    var user: User
    var careTaker: CareTaker
    var dateAndTime: Date
    
    init(
        id: UUID = UUID(),
        user: User,
        careTaker: CareTaker,
        dateAndTime: Date,
    ) {
        self.id = id
        self.user = user
        self.careTaker = careTaker
        self.dateAndTime = dateAndTime
    }
}
