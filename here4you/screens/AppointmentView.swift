//
//  AppointmentView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

struct AppointmentView: View {
    @Environment(\.modelContext) private var modelContext
    @AppStorage("currentUserID") private var currentUserID = ""
    @Query(sort: \Appointment.dateAndTime) private var appointments: [Appointment]
    @Query private var users: [User]
    
    var myAppointments: [Appointment] {
            if currentUserID.isEmpty {
                return appointments
            }
            return appointments.filter { appt in
                appt.user.id.uuidString == currentUserID
            }
        }

    var body: some View {
        List {
            ForEach(myAppointments, id: \.self) { appt in
                VStack(alignment: .leading) {
                    Text("Your booking with \(appt.careTaker.name)")
                        .font(.headline)
                    Text(appt.dateAndTime, format: .dateTime.month().day().hour().minute())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 20)
            }
            .onDelete(perform: deleteAppointment)
        }
        .navigationTitle("Appointments")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Here4You").font(.headline).foregroundStyle(.blue)
            }
            ToolbarItem(placement: .topBarTrailing) { EditButton() }
        }
    }
    private func deleteAppointment(at offsets: IndexSet) {
        for index in offsets {
            let appointmentToDelete = myAppointments[index]
            modelContext.delete(appointmentToDelete)
        }
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete \(error)")
        }
    }
}
