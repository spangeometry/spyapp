//
//  AlphanumericCaesarCipher.swift
//  spyapp
//
//  CaesarCipher that takes input from A-Z and 0-9.
//  Works with secrets from 1 to 7.
//
//  Created by Sam on 9/18/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

struct AlphanumericCaesarCipher: Cipher {
    
    let num0: UInt32 = 48
    let num9: UInt32 = 57
    let capA: UInt32 = 65
    let capZ: UInt32 = 90
    
    func encodeText(_ plaintext: String, secret: String) -> String? {
        
        //Is the secret acceptable, ie. is 1 - 7?
        guard let shiftBy = UInt32(secret) else {
            return "Secret must be between 1 and 7"
        }
        
        if ((shiftBy > 7) || (shiftBy < 1)) {
            return "Secret must be between 1 and 7"
        }
        
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            
            if (unicode >= capA && unicode <= capZ) || (unicode >= num0 && unicode <= num9) { //If unicode isn't in the alphabet or numbers, don't process it
                
                var shiftedUnicode = unicode + shiftBy
                if shiftedUnicode > capZ {
                    shiftedUnicode = shiftedUnicode - capZ + num0 - 1
                }
                if (shiftedUnicode > num9 && shiftedUnicode < capA) {
                    shiftedUnicode = shiftedUnicode - num9 + capA - 1
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
        return encoded
    }
    
    func decodeText(_ codedtext: String, secret: String) -> String? {
        
        guard let shiftBy = UInt32(secret) else {
            return "Secret must be between 1 and 7"
        }
        
        if ((shiftBy > 7) || (shiftBy < 1)) {
            return "Secret must be between 1 and 7"
        }
        
        var encoded = ""
        
        for character in codedtext {
            let unicode = character.unicodeScalars.first!.value
            
            if (unicode >= capA && unicode <= capZ) || (unicode >= num0 && unicode <= num9) {
                
                var shiftedUnicode = unicode - shiftBy
                if shiftedUnicode < num0 {
                    shiftedUnicode = shiftedUnicode + capZ - num0 + 1
                }
                if (shiftedUnicode > num9 && shiftedUnicode < capA) {
                    shiftedUnicode = shiftedUnicode + num9 - capA + 1
                }
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
        return encoded
    }
}
