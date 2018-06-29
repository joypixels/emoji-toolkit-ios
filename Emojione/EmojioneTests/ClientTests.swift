//
//  ClientTests.swift
//  EmojioneTests
//
//  Created by Lai Yip on 6/22/18.
//  Copyright © 2018 Emojione. All rights reserved.
//

import XCTest
@testable import Emojione

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
    
    func testShortnameToUnicode_WhenAsciiIsEnabled_ShouldReplaceSmileysWithUnicodeCharacters() {
        let asciiEnabledClient = Client()
        asciiEnabledClient.ascii = true
        client = asciiEnabledClient
        
        let shortNameWithAsciiString = "Hello :\") :dog: :joy:"
        
        let result = client.shortnameToUnicode(string: shortNameWithAsciiString)
        
        XCTAssertEqual("Hello 😂 🐶 😂", result)
    }
    
    func testAsciiToShortname_ShouldReplaceAsciiSmileysWithShortNames() {
        let asciiString = "Hello :) ;]"
        
        let result = client.asciiToShortname(string: asciiString)
        
        XCTAssertEqual("Hello :slight_smile: :wink:", result)
    }
    
    func testToShort_ShouldReplaceEmojiWithShortNames() {
        let emojiString = "Hello 🐶 🚋 😂 ✍🏻"
        
        let result = client.toShort(string: emojiString)
        
        XCTAssertEqual("Hello :dog: :train: :joy: :writing_hand_tone1:", result)
    }
    
    func testUnicodeToImage_ShouldReplaceEmojiWithImages() {
        let emojiString = "Hello 🐶 🚋 😂 ✍🏻"
        
        let result = client.unicodeToImage(string: emojiString, font: UIFont.systemFont(ofSize: 14))
        
        XCTAssertEqual(16, result.length)
        XCTAssertTrue(result.containsAttachments(in: NSRange(location: 0, length: result.length)))
    }
}
