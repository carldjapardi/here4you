//
//  AppointmentView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

struct AppointmentView: View {
    @Query var appointments: [Appointment]
    
    var body: some View {
        List(appointments) { appt in
            VStack(alignment: .leading) {
                Text("Your booking with \(appt.careTaker.name)")
                    .font(.headline)
                Text(appt.dateAndTime, format: .dateTime.month().day().hour().minute())
                    .font(.subheadline).foregroundStyle(.secondary)
            }
            .padding(.vertical, 20)
        }
        .navigationTitle("Appointments")
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
