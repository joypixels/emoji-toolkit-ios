//
//  ClientTests.swift
//  JoyPixelsTests
//
//  Created by Alex Yip on 6/22/18.
//  Copyright © 2019 JoyPixels Inc. All rights reserved.
//

import XCTest
@testable import JoyPixels

class ClientTests: XCTestCase {

    private var client: ClientInterface!

    override func setUp() {
        super.setUp()

        client = Client()
    }

    override func tearDown() {
        client = nil

        super.tearDown()
    }

    private func enableAscii() {
        let asciiEnabledClient = Client()
        asciiEnabledClient.ascii = true
        client = asciiEnabledClient
    }

    func testShortnameToUnicode_ShouldReplaceShortNamesWithUnicodeCharacters() {
        let shortNameString = ":dog:Hello :joy: :dog::dog:  :joy: :kiss_woman_man:"

        let result = client.shortnameToUnicode(string: shortNameString)

        XCTAssertEqual("🐶Hello 😂 🐶🐶  😂 👩‍❤️‍💋‍👨", result)
    }

    func testShortnameToUnicode_ShouldIgnoreInvalidShortNames() {
        let shortNameString = ":dog:Hello :thisisnotavalidshortname::joy:"

        let result = client.shortnameToUnicode(string: shortNameString)

        XCTAssertEqual("🐶Hello :thisisnotavalidshortname:😂", result)
    }

    func testShortnameToUnicode_WhenAsciiIsDisabled_ShouldIgnoreAsciiSmileys() {
        let shortNameString = ":dog: Hello :) =) :\")"

        let result = client.shortnameToUnicode(string: shortNameString)

        XCTAssertEqual("🐶 Hello :) =) :\")", result)
    }

    func testShortnameToUnicode_WhenAsciiIsEnabled_ShouldReplaceSmileysWithUnicodeCharacters() {
        enableAscii()

        let shortNameWithAsciiString = "Hello :\") :dog: :joy: :smile: :)"

        let result = client.shortnameToUnicode(string: shortNameWithAsciiString)

        XCTAssertEqual("Hello 😂 🐶 😂 😄 🙂", result)
    }

    func testAsciiToShortname_ShouldReplaceAsciiSmileysWithShortNames() {
        let asciiString = "=) Hello :) ;]"

        let result = client.asciiToShortname(string: asciiString)

        XCTAssertEqual(":slight_smile: Hello :slight_smile: :wink:", result)
    }

    func testToShort_ShouldReplaceEmojiWithShortNames() {
        let emojiString = "Hello 🐶 🚋 😂 ✍🏻"

        let result = client.toShort(string: emojiString)

        XCTAssertEqual("Hello :dog: :train: :joy: :writing_hand_tone1:", result)
    }

    func testUnicodeToImage_ShouldReplaceEmojiWithImages() {
        let emojiString = "Hello 🐶 🚋 😂 ✍🏻"

        let result = client.unicodeToImage(string: emojiString, font: UIFont.systemFont(ofSize: 14))

        XCTAssertEqual(13, result.length)
        XCTAssertTrue(result.containsAttachments(in: NSRange(location: 0, length: result.length)))
    }

    func testUnicodeToImage_WhenAsciiIsNotEnabled_ShouldIgnoreSmileys() {
        let emojiString = "Hello :)"

        let result = client.unicodeToImage(string: emojiString, font: UIFont.systemFont(ofSize: 14))

        XCTAssertEqual(8, result.length)
        XCTAssertFalse(result.containsAttachments(in: NSRange(location: 0, length: result.length)))
    }

    func testUnicodeToImage_WhenAsciiIsEnabled_ShouldReplaceSmileysWithImages() {
        enableAscii()

        let emojiString = "Hello :)"

        let result = client.unicodeToImage(string: emojiString, font: UIFont.systemFont(ofSize: 14))

        XCTAssertEqual(7, result.length)
        XCTAssertTrue(result.containsAttachments(in: NSRange(location: 0, length: result.length)))
    }

    func testToImage_WhenAsciiIsEnabled_ShouldReplaceAsciiAndEmojisWithImages() {
        enableAscii()

        let emojiString = "Hello 🐶 🚋 😂 ✍🏻 :) =)"

        let result = client.unicodeToImage(string: emojiString, font: UIFont.systemFont(ofSize: 14))

        XCTAssertEqual(17, result.length)
        XCTAssertTrue(result.containsAttachments(in: NSRange(location: 0, length: result.length)))
    }

    func testToImageAsync_ShouldReplaceEmojiWithImages() {
        let expectation = XCTestExpectation(description: "testToImageAsync_ShouldReplaceEmojiWithImages")

        let emojiString = "Hello 🐶 🚋 😂 ✍🏻"

        client.unicodeToImageAsync(string: emojiString, font: UIFont.systemFont(ofSize: 14)) { result in
            XCTAssertEqual(13, result.length)
            XCTAssertTrue(result.containsAttachments(in: NSRange(location: 0, length: result.length)))
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5.0)
    }
}
