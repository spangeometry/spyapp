//
//  Cipher.swift
//  spyapp
//
//  Created by Sam on 9/18/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

protocol Cipher {
    func encodeText(_ plaintext: String, secret: String) -> String?
    func decodeText(_ plaintext: String, secret: String) -> String?
}
