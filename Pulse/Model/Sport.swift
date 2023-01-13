//
//  Sport.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

struct Sport: Codable {
    let id: String
    let description: String
    let events: [Event]

    enum CodingKeys: String, CodingKey {
        case id = "i"
        case description = "d"
        case events = "e"
    }
}
