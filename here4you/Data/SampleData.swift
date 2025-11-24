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
            MessagesList.self,
            Message.self,
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
            CareTaker(name: "Harry", desc: "Former auror with 5 years of in-home care experience.", rating: 4.5, hourlyRate: 25.0, email: "harry@here4you.com", region: "North Shore"),
            CareTaker(name: "Hermione", desc: "Specializes in dementia care and medication schedules.", rating: 4.7, hourlyRate: 28.0, email: "hermione@here4you.com", region: "Downtown"),
            CareTaker(name: "Ron", desc: "Great with overnight support and companionship.", rating: 4.3, hourlyRate: 23.0, email: "ron@here4you.com", region: "South End"),
        ]
        
        let users = [
            User(name: "Evelyn Harper"),
            User(name: "Marcus Tillman"),
            User(name: "Priya Nair"),
            User(name: "Daniel Cho"),
        ]
        
        let appointments = [
            Appointment(user: users[0], careTaker: caretakers[0], dateAndTime: Date().addingTimeInterval(3_600), location: "123 Main St", status: .scheduled),
            Appointment(user: users[1], careTaker: caretakers[1], dateAndTime: Date().addingTimeInterval(86_400), location: "55 Beacon Ave", status: .scheduled, notes: "Bring updated medication chart."),
            Appointment(user: users[2], careTaker: caretakers[2], dateAndTime: Date().addingTimeInterval(-43_200), location: "77 Park Lane", status: .completed),
        ]
        
        let threads = [
            MessagesList(owner: users[0], participant: caretakers[0]),
            MessagesList(owner: users[1], participant: caretakers[1]),
        ]
        
        let threadMessages: [[Message]] = [
            [
                Message(thread: threads[0], sentByUser: true, body: "Hi Harry, can you cover an extra hour tomorrow?", sentAt: Date().addingTimeInterval(-7_200), isRead: true),
                Message(thread: threads[0], sentByUser: false, body: "Absolutely, I can stay until 5pm.", sentAt: Date().addingTimeInterval(-5_400), isRead: true),
                Message(thread: threads[0], sentByUser: true, body: "Great, thank you!", sentAt: Date().addingTimeInterval(-5_000), isRead: true),
            ],
            [
                Message(thread: threads[1], sentByUser: false, body: "I'll arrive 15 minutes early to review meds.", sentAt: Date().addingTimeInterval(-3_600), isRead: false),
            ],
        ]
        
        users.forEach { context.insert($0) }
        caretakers.forEach { context.insert($0) }
        appointments.forEach { context.insert($0) }
        threads.enumerated().forEach { index, thread in
            context.insert(thread)
            threadMessages[index].forEach { context.insert($0) }
        }
    }
}
