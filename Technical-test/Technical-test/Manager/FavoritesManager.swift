//
//  FavoritesManager.swift
//  Technical-test
//
//  Created by Yaroslav Kupyak on 23.05.2023.
//

import Foundation

class FavoritesManager {
    private let favoritesKey = "favorites"

    init() {}

    func addFavorite(quote: Quote) {
        guard let name = quote.name else {return }
        var favorites = getFavorites()
        favorites.append(name)
        saveFavorites(favorites: favorites)
    }

    func removeFavorite(quote: Quote) {
        var favorites = getFavorites()
        favorites.removeAll { $0 == quote.name }
        saveFavorites(favorites: favorites)
    }

    func isFavorite(quote: Quote) -> Bool {
        guard let name = quote.name else {return false }
        return getFavorites().contains(name)
    }

    func getFavorites() -> [String] {
        if let favorites = UserDefaults.standard.array(forKey: favoritesKey) as? [String] {
            return favorites
        }
        return []
    }

    private func saveFavorites(favorites: [String]) {
        UserDefaults.standard.set(favorites, forKey: favoritesKey)
    }
}
