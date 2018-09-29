//
//  VigenereTests.swift
//  spyappTests
//
//  Tests Vigenere cipher.
//
//  Created by Sam on 9/15/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import XCTest
@testable import spyapp

class VigenereTests: XCTestCase {
    
    func testVigenereEncode() {
        let cipher = VigenereCipher()
        let plaintext = "123HEISENBERG789"
        let secret = "SAUL"
        
        let encoded = cipher.encodeText(plaintext, secret: secret)
        let desired = "123ZECDWNVPJG789"
        
        XCTAssertEqual(encoded, desired)
    }
    
    func testVigenereDecode() {
        let cipher = VigenereCipher()
        let plaintext = "123ZECDWNVPJG789"
        let secret = "SAUL"
        
        let decoded = cipher.decodeText(plaintext, secret: secret)
        let desired = "123HEISENBERG789"
        
        XCTAssertEqual(decoded, desired)
    }
    
}
