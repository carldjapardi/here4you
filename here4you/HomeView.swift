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
    @Environment(\.modelContext) private var modelContext
    var body : some View {
        List {
            ForEach(profiles) {profile in
                Text(profile.name)
                Text(profile.desc)
            }
        }
    }
}
