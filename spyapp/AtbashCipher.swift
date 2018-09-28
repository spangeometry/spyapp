import Foundation

struct AtbashCipher: Cipher {
    
    let capA: Unicode.Scalar = "A"
    let capZ: Unicode.Scalar = "Z"
    
    func encodeText(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        
        for letter in plaintext {
            let unicode = letter.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if ((unicode >= 65) && (unicode <= 90)) {
                shiftedUnicode = UInt32(capZ) - (unicode - UInt32(capA))
            } else {
                shiftedUnicode = unicode
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decodeText(_ plaintext: String, secret: String) -> String? {
        var decoded = ""
        
        for letter in plaintext {
            let unicode = letter.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if ((unicode >= 65) && (unicode <= 90)) {
                shiftedUnicode = UInt32(capZ) - (unicode - UInt32(capA))
            } else {
                shiftedUnicode = unicode
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
    
    func encodeLetter(_ unicode: UInt32) -> UInt32 {
        var shiftedUnicode = unicode
        shiftedUnicode = UInt32(capZ) - (unicode - UInt32(capA))
        return shiftedUnicode
    }
}
