//
//  FavoritesManagerTests.swift
//  Technical-testTests
//
//  Created by Yaroslav Kupyak on 23.05.2023.
//

import XCTest
@testable import Technical_test

class FavoritesManagerTests: XCTestCase {

    var favoritesManager: FavoritesManager!

    override func setUp() {
        super.setUp()
        favoritesManager = FavoritesManager()
    }

    override func tearDown() {
        favoritesManager = nil
        super.tearDown()
    }

    func testAddFavorite() {
        let quote = Quote(symbol: "AAPL", name: "Apple Inc.", currency: "USD", readableLastChangePercent: "1.0%", last: "150.0", variationColor: "green")
        favoritesManager.addFavorite(quote: quote)
        XCTAssertTrue(favoritesManager.isFavorite(quote: quote))
    }

    func testRemoveFavorite() {
        let quote = Quote(symbol: "AAPL", name: "Apple Inc.", currency: "USD", readableLastChangePercent: "1.0%", last: "150.0", variationColor: "green")
        favoritesManager.addFavorite(quote: quote)
        favoritesManager.removeFavorite(quote: quote)
        XCTAssertFalse(favoritesManager.isFavorite(quote: quote))
    }

    func testGetFavorites() {
        let quote = Quote(symbol: "AAPL", name: "Apple Inc.", currency: "USD", readableLastChangePercent: "1.0%", last: "150.0", variationColor: "green")
        favoritesManager.addFavorite(quote: quote)
        let favorites = favoritesManager.getFavorites()
        XCTAssertTrue(favorites.contains(quote.name!))
    }
}
