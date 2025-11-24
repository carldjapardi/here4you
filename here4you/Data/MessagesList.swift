//
//  Messages.swift
//  here4you
//
//  Created by Carl on 11/21/25.
//

import SwiftData

@Model
final class MessagesList {
    var owner: User
    var participant: CareTaker
    @Relationship(deleteRule: .cascade, inverse: \Message.thread)
    var messages: [Message]
    
    init(
        owner: User,
        participant: CareTaker,
        messages: [Message] = []
    ) {
        self.owner = owner
        self.participant = participant
        self.messages = messages
    }
    
    var latestMessage: Message? {
        messages.sorted { $0.sentAt > $1.sentAt }.first
    }
}
