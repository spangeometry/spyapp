import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Caesar": CaesarCipher(),
        "Atbash": AtbashCipher(),
        "Vigenère": VigenereCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
