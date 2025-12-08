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
    @AppStorage("currentUserID") private var currentUserID = ""
    @State private var selectedCareTaker: CareTaker?
    
    var body: some View {
        let currentUser = users.first(where: { $0.id.uuidString == currentUserID }) ?? users.first
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
        .navigationTitle("CareTaker Profiles")
        .toolbar {ToolbarItem(placement: .principal) {
            Text("Here4You").font(.headline).foregroundStyle(.blue)
        }}
        .sheet(item: $selectedCareTaker) { careTaker in
            if let currentUser {
                SheetRouterView(
                    careTaker: careTaker,
                    currentUser: currentUser,
                    modelContext: modelContext,
                    selectedCareTaker: $selectedCareTaker
                )
            }
        }
    }
}
