//
//  EventListViewModel.swift
//  Pulse
//
//  Created by Rafael Lima on 15/01/2023.
//

import Foundation

class EventListViewModel {

    private var favories: [Event] = []
    private let repository: FavoriteRepository!

    init(repository: FavoriteRepository = FavoriteRepository()) {
        self.repository = repository
        self.favories = repository.list()
    }

    func favorite(event: Event) {
        let isFavorite = isFavorite(event: event)

        if isFavorite {
            favories.removeAll(where: { $0.id == event.id })
            repository.remove(event: event)
        } else {
            favories.append(event)
            repository.save(event: event)
        }
    }

    func isFavorite(event: Event) -> Bool {
        return favories.contains(where: { $0.id == event.id })
    }
}
