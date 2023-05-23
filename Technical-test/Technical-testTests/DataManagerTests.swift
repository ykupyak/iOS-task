//
//  Technical_testTests.swift
//  Technical-testTests
//
//  Created by Yaroslav Kupyak on 23.05.2023.
//

import XCTest
@testable import Technical_test

class DataManagerTests: XCTestCase {

    var dataManager: DataManager!

    override func setUp() {
        super.setUp()
        dataManager = DataManager()
    }

    override func tearDown() {
        dataManager = nil
        super.tearDown()
    }

    func testFetchQuotes() async {
        do {
            let quotes = try await dataManager.fetchQuotes()
            XCTAssertNotNil(quotes)
            XCTAssertGreaterThan(quotes.count, 0)
        } catch {
            XCTFail("Error fetching quotes: \(error)")
        }
    }
}
