//
//  ExtensionTest.swift
//  Technical-testTests
//
//  Created by Yaroslav Kupyak on 23.05.2023.
//

import XCTest
@testable import Technical_test

class UIColorConvertTests: XCTestCase {

    func testFromStringRed() {
        let colorString = "red"
        let color = UIColor.fromString(colorString)
        XCTAssertEqual(color, UIColor.red)
    }

    func testFromStringRed2() {
        let colorString = "Red"
        let color = UIColor.fromString(colorString)
        XCTAssertEqual(color, UIColor.red)
    }

    func testFromStringRed3() {
        let colorString = "RED"
        let color = UIColor.fromString(colorString)
        XCTAssertEqual(color, UIColor.red)
    }

    func testFromStringRed4() {
        let colorString = "rede"
        let color = UIColor.fromString(colorString)
        XCTAssertEqual(color, UIColor.black)
    }

    func testFromStringGreen() {
        let colorString = "green"
        let color = UIColor.fromString(colorString)
        XCTAssertEqual(color, UIColor.green)
    }

    func testFromStringDefault() {
        let colorString = "unknown"
        let color = UIColor.fromString(colorString)
        XCTAssertEqual(color, UIColor.black)
    }

    func testFromStringNil() {
        let colorString: String? = nil
        let color = UIColor.fromString(colorString)
        XCTAssertEqual(color, UIColor.black)
    }
}
