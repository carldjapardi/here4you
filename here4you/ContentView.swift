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
                HomeView()
            }
            Tab("Message", systemImage: "message.fill") {
                MessageView()
            }.badge(2)
            Tab("Appointment", systemImage: "calendar") {
                AppointmentView()
            }
            Tab("Account", systemImage: "person.crop.circle") {
                AccountView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
