//
//  SampleData.swift
//  here4you
//
//  Created by Carl on 11/21/25.
//

import SwiftData
import Foundation

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelContainer: ModelContainer
    var context: ModelContext {
        modelContainer.mainContext
    }
    private init() {
        let schema = Schema([
            CareTaker.self,
            Appointment.self,
            User.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    private func insertSampleData() {
        let caretakers = [
            CareTaker(name: "Harry", desc: "Former auror with 5 years of in-home care experience."),
            CareTaker(name: "Hermione", desc: "Specializes in dementia care and medication schedules."),
            CareTaker(name: "Ron", desc: "Great with overnight support and companionship."),
        ]
        
        let users = [
            User(name: "Evelyn Harper"),
            User(name: "Marcus Tillman"),
            User(name: "Priya Nair"),
            User(name: "Daniel Cho"),
        ]
        
        let appointments = [
            Appointment(user: users[0], careTaker: caretakers[0], dateAndTime: Date().addingTimeInterval(3_600)),
            Appointment(user: users[1], careTaker: caretakers[1], dateAndTime: Date().addingTimeInterval(86_400)),
            Appointment(user: users[2], careTaker: caretakers[2], dateAndTime: Date().addingTimeInterval(-43_200)),
        ]
        
        users.forEach { context.insert($0) }
        caretakers.forEach { context.insert($0) }
        appointments.forEach { context.insert($0) }
    }
}
