//
//  FavoriteRepository.swift
//  Pulse
//
//  Created by Rafael Lima on 15/01/2023.
//

import Foundation

struct FavoriteRepository {

    func save(event: Event) {
        var entities = UserDefaults.standard.favorites
        entities.append(event)
        UserDefaults.standard.favorites = entities
    }

    func list() -> [Event] {
        return UserDefaults.standard.favorites
    }

    func remove(event: Event) {
        var entities = UserDefaults.standard.favorites
        entities.removeAll(where: { $0.id == event.id })
        UserDefaults.standard.favorites = entities
    }
}
