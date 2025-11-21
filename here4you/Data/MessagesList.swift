//
//  Messages.swift
//  here4you
//
//  Created by Carl on 11/21/25.
//

import SwiftData

@Model
class MessagesList {
    var messageProfiles: [Profile]
    
    init(messageProfiles: [Profile]) {
        self.messageProfiles = messageProfiles
    }
    static let sampleData = [
        MessagesList(messageProfiles: [Profile.sampleData[0], Profile.sampleData[2]]),
    ]
}
