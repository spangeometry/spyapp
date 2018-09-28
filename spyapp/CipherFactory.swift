//
//  CipherFactory.swift
//  spyapp
//
//  Chooses the appropriate cipher when ViewController.swift takes input
//
//  Created by Sam on 9/18/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Caesar": AlphanumericCaesarCipher(),
        "Atbash": AtbashCipher(),
        "Vigenère": VigenereCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
