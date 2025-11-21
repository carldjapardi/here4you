//
//  profile.swift
//  here4you
//
//  Created by Carl on 11/20/25.
//

import SwiftData
import Foundation

@Model
class Profile {
    var name: String
    var desc: String
    var rating: Double
    var hourlyRate: Double
    
    init(name: String, desc: String, rating: Double, hourlyRate: Double) {
        self.name = name
        self.desc = desc
        self.rating = rating
        self.hourlyRate = hourlyRate
    }
    
    static let sampleData = [
        Profile(name: "Harry", desc: "Hello", rating: 4.5, hourlyRate: 25.0),
        Profile(name: "Hermione", desc: "Hello1", rating: 4.7, hourlyRate: 22.0),
        Profile(name: "Ron", desc: "Hello2", rating: 4.3, hourlyRate: 23.0),
        Profile(name: "Ginny", desc: "Hello3", rating: 2.1, hourlyRate: 21.0),
        Profile(name: "Cho", desc: "Hello4", rating: 1.5, hourlyRate: 19.5),
    ]
}
