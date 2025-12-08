//
//  AccountView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

struct AccountView: View {
    @Query private var users: [User]
    @AppStorage("currentUserID") private var currentUserID = ""
    @Environment(\.modelContext) private var modelContext
    
    var currentUser: User? {
        users.first { $0.id.uuidString == currentUserID }
    }
    
    var body: some View {
        List {
            Section("Choose User") {
                ForEach(users) { user in
                    Button {
                        currentUserID = user.id.uuidString
                    } label: {
                        HStack {
                            Text(user.name)
                            Spacer()
                            if currentUserID == user.id.uuidString {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            
            if let currentUser {
                Section("User Details") {
                    EditableField(title: "Name", text: Binding(
                        get: { currentUser.name },
                        set: { currentUser.name = $0; try? modelContext.save() }
                    ))
                    EditableField(title: "Location", text: Binding(
                        get: { currentUser.location },
                        set: { currentUser.location = $0; try? modelContext.save() }
                    ))
                    EditableField(title: "Phone", text: Binding(
                        get: { currentUser.phone },
                        set: { currentUser.phone = $0; try? modelContext.save() }
                    ))
                }
            }
        }
        .navigationTitle("Account")
    }
}

struct EditableField: View {
    let title: String
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if isEditing {
                TextField(title, text: $text)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .onSubmit {
                        isEditing = false
                    }
            } else {
                Text(text.isEmpty ? "Tap to edit" : text)
                    .foregroundColor(text.isEmpty ? .secondary : .primary)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isEditing = true
        }
    }
}
