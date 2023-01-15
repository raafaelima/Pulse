//
//  UserDefaults+Keys.swift
//  Pulse
//
//  Created by Rafael Lima on 15/01/2023.
//

import Foundation

private enum Keys: String {
    case favorites = "com.rcl.favorites"
}

// MARK: Settings Data
extension UserDefaults {

    var favorites: [Event] {
        get {
            return getArray(forKey: Keys.favorites.rawValue) ?? []
        }
        set {
            setArray(newValue, forKey: Keys.favorites.rawValue)
        }
    }
}

// MARK: Array Utils
extension UserDefaults {
    func setArray<T: Storable>(_ array: [T], forKey key: String) {
        let data = try? JSONEncoder().encode(array)
        set(data, forKey: key)
    }

    func getArray<T: Storable>(forKey key: String) -> [T]? {
        guard let data = data(forKey: key) else {
            return nil
        }

        return try? JSONDecoder().decode([T].self, from: data)
    }
}
