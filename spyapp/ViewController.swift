//
//  ViewController.swift
//  spyapp
//
//  Handles the main interface inputs.
//
//  Created by Sam on 9/15/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cipherControl: UISegmentedControl!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var encodeButton: UIButton!
    @IBOutlet weak var decodeButton: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var cipherOutputLabel: UILabel!
    
    let factory = CipherFactory()
    var cipherSelectedName: String = "Caesar"
    var cipher: Cipher?
    
    var inputText: String {
        if let text = inputField.text {
            return text.uppercased()
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = secretField.text {
            return text.uppercased()
        } else {
            return ""
        }
    }
    
    override var prefersStatusBarHidden: Bool { //Keeps status bar visible in landscape
        return false
    }
    
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        cipher = factory.cipher(for: cipherSelectedName)
        let decoded = cipher?.decodeText(inputText, secret: secretText)
        cipherOutputLabel.text = decoded
    }
    
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        cipher = factory.cipher(for: cipherSelectedName)
        let encoded = cipher?.encodeText(inputText, secret: secretText)
        cipherOutputLabel.text = encoded
    }
    
    @IBAction func cipherSelected(_ sender: Any) {
        switch cipherControl.selectedSegmentIndex {
        case 0:
            outputLabel.text = "Output - Caesar";
            cipherSelectedName = cipherControl.titleForSegment(at: cipherControl.selectedSegmentIndex)!
            secretField.text = ""
            secretField.placeholder = "Caesar accepts numerical keys from 1 to 7"
            secretField.isUserInteractionEnabled = true
        case 1:
            outputLabel.text = "Output - Atbash";
            cipherSelectedName = cipherControl.titleForSegment(at: cipherControl.selectedSegmentIndex)!
            secretField.text = ""
            secretField.placeholder = "Atbash does not use a key"
            secretField.isUserInteractionEnabled = false
        case 2:
            outputLabel.text = "Output - Vigenère";
            cipherSelectedName = cipherControl.titleForSegment(at: cipherControl.selectedSegmentIndex)!
            secretField.text = ""
            secretField.placeholder = "Vigenère accepts alphabetical keys"
            secretField.isUserInteractionEnabled = true
        default:
            break
        }
    }
    
}

