//
//  here4youApp.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

@main
struct here4youApp: App {
    private let container: ModelContainer
    
    init() {
        let schema = Schema([CareTaker.self, Appointment.self, User.self,])
        let configuration = ModelConfiguration()
        container = try! ModelContainer(for: schema, configurations: [configuration])
        seedIfNeeded(context: container.mainContext)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
        }
    }
    
    private func seedIfNeeded(context: ModelContext) {
        let caretakerCount = (try? context.fetch(FetchDescriptor<CareTaker>()))?.count ?? 0
        if caretakerCount > 0 { return }
        
        let caretakers = [
            CareTaker(
                name: "Minerva McGonagall",
                desc: "Strict but fair, experienced with elderly care and daily assistance.",
                location: "Santa Rosa",
                hourlyRate: 45.00,
                phoneNumber: "707-555-0123"
            ),
            CareTaker(
                name: "Rubeus Hagrid",
                desc: "Strong but gentle, specializes in heavy lifting and mobility support.",
                location: "Napa",
                hourlyRate: 38.50,
                phoneNumber: "707-555-0987"
            ),
            CareTaker(
                name: "Pomona Sprout",
                desc: "Great with medication reminders, nutrition, and light outdoor exercise.",
                location: "Sonoma",
                hourlyRate: 42.00,
                phoneNumber: "707-555-3456"
            ),
            CareTaker(
                name: "Remus Lupin",
                desc: "Calm and patient, expert in overnight care and companionship.",
                location: "San Rafael",
                hourlyRate: 40.00,
                phoneNumber: "415-555-6789"
            ),
            CareTaker(
                name: "Luna Lovegood",
                desc: "Focuses on dementia care with exceptional patience and empathy.",
                location: "Petaluma",
                hourlyRate: 35.00,
                phoneNumber: "707-555-4321"
            )
        ]
        
        let users = [
            User(name: "Evelyn Harper"),
            User(name: "Marcus Tillman"),
            User(name: "Priya Nair"),
            User(name: "Daniel Cho"),
            User(name: "Liam O'Connor"),
        ]
        
        caretakers.forEach { context.insert($0) }
        users.forEach { context.insert($0) }
        try? context.save()
        
        if UserDefaults.standard.string(forKey: "currentUserID") == nil,
           let firstUser = users.first {
            UserDefaults.standard.set(firstUser.id.uuidString, forKey: "currentUserID")
        }
    }
}
