//
//  CaesarTests.swift
//  spyappTests
//
//  Tests Caesar cipher.
//
//  Created by Sam on 9/15/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import XCTest
@testable import spyapp

class CaesarTests: XCTestCase {
    
    func testCaesarEncode() {
        let cipher = AlphanumericCaesarCipher()
        let plaintext = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let secret = "7"
        
        let encoded = cipher.encodeText(plaintext, secret: secret)
        let desired = "HIJKLMNOPQRSTUVWXYZ0123456789ABCDEFG"
        
        XCTAssertEqual(encoded, desired)
    }
    
    func testCaesarDecode() {
        let cipher = AlphanumericCaesarCipher()
        let plaintext = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let secret = "7"
        
        let decoded = cipher.decodeText(plaintext, secret: secret)
        let desired = "3456789ABCDEFGHIJKLMNOPQRSTUVWXYZ012"
        
        XCTAssertEqual(decoded, desired)
    }

}
