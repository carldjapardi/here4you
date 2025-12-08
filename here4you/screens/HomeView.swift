//
//  HomeView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var profiles: [CareTaker]
    @Query private var users: [User]
    @Environment(\.modelContext) private var modelContext
    @State private var selectedCareTaker: CareTaker?
    
    var body: some View {
        let currentUser = users.first ?? User(name: "Evelyn Harper")
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(profiles) { profile in
                    CareTakerCard(careTaker: profile) {
                        selectedCareTaker = profile
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Caretaker Profiles")
        .sheet(item: $selectedCareTaker) { careTaker in
            SheetRouterView(
                careTaker: careTaker,
                currentUser: currentUser,
                modelContext: modelContext,
                selectedCareTaker: $selectedCareTaker,
            )
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
