//
//  AppointmentView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

struct AppointmentView: View {
    @Query(sort: \Appointment.dateAndTime, order: .forward) private var appointments: [Appointment]
    
    var body: some View {
        List {
            ForEach(appointments, id: \.id) { appt in
                VStack(alignment: .leading, spacing: 4) {
                Text("\(appt.user.name) · \(appt.careTaker.name)")
                    .font(.headline)
                Text(appt.dateAndTime, format: .dateTime.month().day().hour().minute())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(appt.location)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                Text(appt.status.rawValue.capitalized)
                    .font(.caption.bold())
                    .foregroundColor(appt.status == .cancelled ? .red : .green)
            }
            .padding(.vertical, 4)
            }
        }
        .navigationTitle("Appointments")
    }
}
