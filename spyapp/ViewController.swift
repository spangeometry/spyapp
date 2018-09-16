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
    
    @IBAction func cipherSelected(_ sender: Any) {
        switch cipherControl.selectedSegmentIndex {
        case 0:
            outputLabel.text = "Output - Caesar";
        case 1:
            outputLabel.text = "Output - Atbash";
        case 2:
            outputLabel.text = "Output - Vigenère";
        default:
            break
        }
    }
    

}

