//
//  BookingView.swift
//  here4you
//
//  Created by Carl on 12/7/25.
//

import SwiftData
import SwiftUI

struct BookingView: View {
    let careTaker: CareTaker
    let user: User
    let modelContext: ModelContext
    let onDismiss: () -> Void
    
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var showSuccessAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                } header: { Text("Select Date") }
                
                Section {
                    DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                } header: { Text("Select Time") }
                
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Appointment Summary").font(.headline)
                        Text("Caretaker: \(careTaker.name)").font(.subheadline).foregroundColor(.secondary)
                        Text("Date & Time: \(appointmentDate.formatted(date: .abbreviated, time: .shortened))").font(.subheadline).foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                
                Section {
                    Button(action: bookAppointment) {
                        HStack {
                            Text("Confirm Booking").fontWeight(.semibold)
                        }
                    }
                    .disabled(appointmentDate < Date())
                }
            }
            .navigationTitle("Book Appointment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { onDismiss() }
                }
            }
            .alert("Appointment Booked!", isPresented: $showSuccessAlert) {
                Button("OK") { onDismiss() }
            } message: {
                Text("Your appointment with \(careTaker.name) has been scheduled for \(appointmentDate.formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
    
    private func bookAppointment() {
        let appointment = Appointment(
            user: user,
            careTaker: careTaker,
            dateAndTime: appointmentDate
        )
        modelContext.insert(appointment)
        do {
            try modelContext.save()
            showSuccessAlert = true
        } catch {
            print("Failed to save appointment: \(error)")
        }
    }
    
    private var appointmentDate: Date {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: selectedDate)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: selectedTime)
        
        var combinedComponents = DateComponents()
        combinedComponents.year = dateComponents.year
        combinedComponents.month = dateComponents.month
        combinedComponents.day = dateComponents.day
        combinedComponents.hour = timeComponents.hour
        combinedComponents.minute = timeComponents.minute
        
        return calendar.date(from: combinedComponents) ?? Date()
    }
}
