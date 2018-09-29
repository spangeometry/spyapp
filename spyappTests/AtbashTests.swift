//
//  AtbashTests.swift
//  spyappTests
//
//  Tests Atbash cipher.
//
//  Created by Sam on 9/15/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import XCTest
@testable import spyapp

class AtbashTests: XCTestCase {
    
    func testAtbashEncode() {
        let cipher = AtbashCipher()
        let plaintext = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let encoded = cipher.encodeText(plaintext, secret: "")
        let desired = "ZYXWVUTSRQPONMLKJIHGFEDCBA0123456789"
        
        XCTAssertEqual(encoded, desired)
    }
    
    func testAtbashDecode() {
        let cipher = AtbashCipher()
        let plaintext = "ZYXWVUTSRQPONMLKJIHGFEDCBA0123456789"
        
        let encoded = cipher.decodeText(plaintext, secret: "")
        let desired = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        XCTAssertEqual(encoded, desired)
    }
    
}
