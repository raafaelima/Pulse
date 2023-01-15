//
//  Event.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

struct Event: Storable {
    var id: String
    let name: String
    let sportId: String
    let description: String
    var isFavorite: Bool = false
    private let timestamp: Double
    var date: Date {
        Date(timeIntervalSince1970: timestamp)
    }

    func timeIntervalToToday() -> String {
        let today = Date()
        let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: today, to: self.date)
        let hour = difference.hour ?? 0
        let minute = difference.minute ?? 0
        let second = difference.second ?? 0

        return (hour > 0 && minute > 0 && second > 0) ? "Due in: \(hour)h \(minute)m" : "Overdue"
    }
}

extension Event: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "i"
        case sportId = "si"
        case description = "d"
        case name = "sh"
        case timestamp = "tt"
    }
}
