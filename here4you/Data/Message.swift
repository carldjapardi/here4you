//
//  Message.swift
//  here4you
//
//  Created by Carl on 11/24/25.
//

import SwiftData
import Foundation

@Model
final class Message {
    @Attribute(.unique) var id: UUID
    var thread: MessagesList
    var sentByUser: Bool
    var body: String
    var sentAt: Date
    var isRead: Bool
    
    init(
        id: UUID = UUID(),
        thread: MessagesList,
        sentByUser: Bool,
        body: String,
        sentAt: Date = .now,
        isRead: Bool = false
    ) {
        self.id = id
        self.thread = thread
        self.sentByUser = sentByUser
        self.body = body
        self.sentAt = sentAt
        self.isRead = isRead
    }
}

