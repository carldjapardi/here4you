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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Profile.self)
        }
    }
}
