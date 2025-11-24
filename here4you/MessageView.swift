//
//  MessageView.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftUI
import SwiftData

struct MessageView: View {
    @Query(sort: \MessagesList.participant.name, order: .forward) private var messageThreads: [MessagesList]
    
    var body: some View {
        List(messageThreads) { thread in
            VStack(alignment: .leading, spacing: 4) {
                Text(thread.participant.name)
                    .font(.headline)
                if let latest = thread.latestMessage {
                    Text(latest.body)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                    Text(latest.sentAt, style: .time)
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                } else {
                    Text("No messages yet")
                        .font(.subheadline)
                        .foregroundStyle(.tertiary)
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Messages")
    }
}
