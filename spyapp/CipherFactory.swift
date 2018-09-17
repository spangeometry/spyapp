import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CaeserCipher(),
        "Button": CaeserCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
