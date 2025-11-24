//
//  ContentView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                NavigationStack {
                    HomeView()
                }
            }
            Tab("Messages", systemImage: "message.fill") {
                NavigationStack {
                    MessageView()
                }
            }
            Tab("Appointments", systemImage: "calendar") {
                NavigationStack {
                    AppointmentView()
                }
            }
            Tab("Account", systemImage: "person.crop.circle") {
                NavigationStack {
                    AccountView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
