//
//  SheetRouterView.swift
//  here4you
//
//  Created by Carl on 12/7/25.
//

import SwiftUI
import SwiftData

struct SheetRouterView: View {
    let careTaker: CareTaker
    let currentUser: User
    let modelContext: ModelContext
    @Binding var selectedCareTaker: CareTaker?
    @State private var isShowingBookingView = false
    
    var body : some View {
        Group {
            if isShowingBookingView {
                BookingView(
                    careTaker: careTaker,
                    user: currentUser,
                    modelContext: modelContext,
                    onDismiss: {
                        isShowingBookingView = false
                        selectedCareTaker = nil
                    }
                )
            } else {
                CareTakerDetailSheet(
                    careTaker: careTaker,
                    onBookAppointment: {isShowingBookingView = true},
                    selectedCareTaker: $selectedCareTaker
                )
            }
        }
    }
}
