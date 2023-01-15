//
//  EventListViewModel.swift
//  Pulse
//
//  Created by Rafael Lima on 15/01/2023.
//

import Foundation

class EventListViewModel {

    private var favories: [Event] = []

    func favorite(event: Event) {
        let isFavorite = isFavorite(event: event)

        if isFavorite {
            favories.removeAll(where: { $0.id == event.id })
        } else {
            favories.append(event)
        }
    }

    func isFavorite(event: Event) -> Bool {
        return favories.contains(where: { $0.id == event.id })
    }
}
