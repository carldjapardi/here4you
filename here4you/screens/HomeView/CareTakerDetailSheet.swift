//
//  CareTakerDetailSheet.swift
//  here4you
//
//  Created by Carl on 12/7/25.
//

import SwiftUI
import SwiftData

struct CareTakerDetailSheet: View {
    let careTaker: CareTaker
    let onBookAppointment: () -> Void
    @Binding var selectedCareTaker: CareTaker?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack(spacing: 20) {
                        circleComponent
                        VStack(alignment: .leading, spacing: 8) {
                            Text(careTaker.name).font(.largeTitle).fontWeight(.bold)
                            Text(careTaker.location).font(.headline).foregroundColor(.green)
                            Text(careTaker.phoneNumber).font(.headline).foregroundColor(.green)
                        }
                        Spacer()
                    }
                    .padding(.top)
                    
                    Divider()
                    
                    // Description
                    VStack(alignment: .leading, spacing: 12) {
                        Text("About").font(.title2).fontWeight(.semibold)
                        Text(careTaker.desc).font(.body).foregroundColor(.secondary)
                    }
                    
                    // Book Appointment Button
                    Button(action: { onBookAppointment() }) {
                        HStack {
                            Image(systemName: "calendar.badge.plus")
                            Text("Book Appointment").fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity).padding().background(Color.blue.gradient).foregroundColor(.white).cornerRadius(12)
                    }
                    .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle("Caretaker Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        selectedCareTaker = nil
                    }
                }
            }
        }
    }
    private var circleComponent: some View {
        Circle()
            .fill(Color.blue.gradient)
            .frame(width: 80, height: 80)
            .overlay {
                Text(String(careTaker.name.prefix(1)))
                    .font(.system(size: 40)).fontWeight(.bold).foregroundColor(.white)
            }
    }
}
