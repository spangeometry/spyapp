//
//  ViewController.swift
//  spyapp
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
    
    var cipherSelected: Int = 0
    
    var inputText: String {
        if let text = inputField.text {
            return text
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = secretField.text {
            return text
        } else {
            return ""
        }
    }
    
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        
    }
    
    /*
     @IBAction func encodeButtonPressed(_ sender: UIButton) {
         guard let cipher = self.cipher else {
             output.text = "No cipher selected"
             return
        }
         if let encoded = cipher.encode(plaintext, secret: secretText) {
         output.text = encoded
         } else {
         output.text = "Error encoding"
         }
     }
     
     @IBAction func cipherButtonPressed(_ sender: UIButton) {
     guard
     let buttonLable = sender.titleLabel,
     let buttonText = buttonLable.text
     else {
     output.text = "No button or no button text"
     return
     }
     cipher = factory.cipher(for: buttonText)
     }
     */
    
    @IBAction func cipherSelected(_ sender: Any) {
        switch cipherControl.selectedSegmentIndex {
        case 0:
            outputLabel.text = "Output - Caesar";
            cipherSelected = 0
        case 1:
            outputLabel.text = "Output - Atbash";
            cipherSelected = 1
        case 2:
            outputLabel.text = "Output - Vigenère";
            cipherSelected = 2
        default:
            break
        }
    }
    

}

