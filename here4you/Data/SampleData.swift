//
//  SampleData.swift
//  here4you
//
//  Created by Carl on 11/21/25.
//

import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelContainer: ModelContainer
    var context: ModelContext {
        modelContainer.mainContext
    }
    private init() {
        let schema = Schema([
            Profile.self,
            MessagesList.self,
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
        for profile in Profile.sampleData {
            context.insert(profile)
        }
        for messagesList in MessagesList.sampleData {
            context.insert(messagesList)
        }
    }
}
