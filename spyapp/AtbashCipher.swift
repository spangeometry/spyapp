//
//  AtbashCipher.swift
//  spyapp
//
//  AtbashCipher that takes input from A-Z and 0-9.
//  Doesn't need a secret.
//
//  Created by Sam on 9/18/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

struct AtbashCipher: Cipher {
    
    let num0: UInt32 = 48
    let num9: UInt32 = 57
    let capA: UInt32 = 65
    let capZ: UInt32 = 90
    
    func encodeText(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for letter in plaintext {
            let unicode = letter.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if ((unicode >= capA) && (unicode <= capZ)) {
                shiftedUnicode = capZ - (unicode - capA)
            } else if ((unicode >= num0) && (unicode <= num9)) {
                shiftedUnicode = unicode
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decodeText(_ codedtext: String, secret: String) -> String? {
        var decoded = ""
        
        for letter in codedtext {
            let unicode = letter.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if ((unicode >= capA) && (unicode <= capZ)) {
                shiftedUnicode = capZ - (unicode - capA)
            } else if ((unicode >= num0) && (unicode <= num9)) {
                shiftedUnicode = unicode
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }

}
