//
//  VigenereCipher.swift
//  spyapp
//
//  VigenereCipher that takes input from A-Z and 0-9.
//  Takes a word as a secret.
//
//  Created by Sam on 9/18/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

struct VigenereCipher: Cipher {
    
    let num0: UInt32 = 48
    let num9: UInt32 = 57
    let capA: UInt32 = 65
    let capZ: UInt32 = 90
    let alphabetLength: Int = 26
    
    func checkKey(_ secret: String) -> String {
        var ourSecret = ""
        
        for character in secret {
            let unicode = character.unicodeScalars.first!.value
            if (unicode >= capA && unicode <= capZ) {
                ourSecret = ourSecret + String(UnicodeScalar(UInt8(unicode)))
            }
        }
        return ourSecret
    }
    
    func keyGenerator(_ plaintext: String, secret: String) -> String {
        var keySizeMatchesString: Bool = false
        var keyIndex: Int = 0
        var keyString: String = checkKey(secret)
        
        while (!keySizeMatchesString) {
            if plaintext.count == keyIndex {
                keyIndex = 0;
            }
            if keyString.count == plaintext.count {
                keySizeMatchesString = true
                break
            }
            let index = keyString.index(keyString.startIndex, offsetBy: keyIndex)
            keyString = keyString + String(keyString[index])
            keyIndex = keyIndex + 1
        }
        
        return keyString
        
    }
    
    func encodeText(_ plaintext: String, secret: String) -> String? {
        let genSecret: String = keyGenerator(plaintext, secret: secret)
        var encodedText: String = ""
        var keyIndex: Int = 0
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            if (unicode >= capA && unicode <= capZ) { //If it's a letter...
                let unicode = character.unicodeScalars.first!.value
                let index = genSecret.index(genSecret.startIndex, offsetBy: keyIndex)
                let keychar = String(genSecret[index])
                let keyUnicode = keychar.unicodeScalars.first!.value
            
                let sUnicode = Int(unicode)
                let sKeyUnicode = Int(keyUnicode)
            
                var shiftedCharacter = abs((sUnicode + sKeyUnicode) % alphabetLength)
                shiftedCharacter = shiftedCharacter + Int(capA)

                encodedText = encodedText + String(UnicodeScalar(UInt8(shiftedCharacter)))
                keyIndex = keyIndex + 1
            } else if (unicode >= num0 && unicode <= num9) {
                encodedText = encodedText + String(UnicodeScalar(UInt8(unicode)))
            }
        }
        
        return encodedText
    }
    
    func decodeText(_ codedtext: String, secret: String) -> String? {
        let genSecret: String = keyGenerator(codedtext, secret: secret)
        var decodedText: String = ""
        var keyIndex: Int = 0
        for character in codedtext {
            let unicode = character.unicodeScalars.first!.value
            if (unicode >= capA && unicode <= capZ) {
                let unicode = character.unicodeScalars.first!.value
                let index = genSecret.index(genSecret.startIndex, offsetBy: keyIndex)
                let keychar = String(genSecret[index])
                let keyUnicode = keychar.unicodeScalars.first!.value
                
                let sUnicode = Int(unicode)
                let sKeyUnicode = Int(keyUnicode)
                
                var shiftedCharacter = abs((sUnicode - sKeyUnicode + alphabetLength) % alphabetLength)
                shiftedCharacter = shiftedCharacter + Int(capA)
                
                decodedText = decodedText + String(UnicodeScalar(UInt8(shiftedCharacter)))
                keyIndex = keyIndex + 1
            } else if (unicode >= num0 && unicode <= num9) {
                decodedText = decodedText + String(UnicodeScalar(UInt8(unicode)))
            }
        }
        
        return decodedText
    }


    

}
