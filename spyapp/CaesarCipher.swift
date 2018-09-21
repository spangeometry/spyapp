import Foundation

struct CaesarCipher: Cipher {

    func encodeText(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            
            if (unicode >= "A".unicodeScalars.first!.value && unicode <= "Z".unicodeScalars.first!.value) || (unicode >= "0".unicodeScalars.first!.value && unicode <= "9".unicodeScalars.first!.value) { //If unicode isn't in the alphabet or numbers, don't process it
                
                var shiftedUnicode = unicode + shiftBy //
                
                if shiftedUnicode > "Z".unicodeScalars.first!.value {
                    //if temp = shiftedunicode - 90 > 10, let encode temp - a and lot that
                    //self encodetext re-encode the whole string
                    shiftedUnicode = shiftedUnicode - "Z".unicodeScalars.first!.value + "0".unicodeScalars.first!.value - 1
                }
                if (shiftedUnicode > "9".unicodeScalars.first!.value && shiftedUnicode < "A".unicodeScalars.first!.value) {
                    shiftedUnicode = shiftedUnicode - "9".unicodeScalars.first!.value + "A".unicodeScalars.first!.value - 1
                }
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            
        }
        return encoded
    }
    
    func decodeText(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded.uppercased()
    }
}
