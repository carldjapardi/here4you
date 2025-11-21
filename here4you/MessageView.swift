//
//  MessageView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

struct MessageView: View {
    @Query private var msgList: [MessagesList]
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        List {
            ForEach(msgList) { msg in
                Text(msg.messageProfiles[0].name)
            }
        }
    }
}
