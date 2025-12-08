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
    
    var body: some View {
        List(users) { user in
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
        .navigationTitle("Choose User Account")
    }
}
