//
//  spyappTests.swift
//  spyappTests
//
//  Created by Sam on 9/15/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import XCTest
@testable import spyapp

class spyappTests: XCTestCase {
    
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
