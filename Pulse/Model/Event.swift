//
//  Event.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

struct Event: Codable {
    let id: String
    let sportId: String
    let name: String
    let description: String
    private let timestamp: Double
    
    var date: Date {
        return Date(timeIntervalSince1970: timestamp)
    }

    enum CodingKeys: String, CodingKey {
        case id = "i"
        case sportId = "si"
        case description = "d"
        case name = "sh"
        case timestamp = "tt"
    }
}
