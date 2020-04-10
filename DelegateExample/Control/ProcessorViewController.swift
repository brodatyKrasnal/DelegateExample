//
//  ProcessorViewController.swift
//  DelegateExample
//
//  Created by Daniel Golęba Frygies on 09/04:100.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
// boss

import UIKit

protocol DefinedItemsDelegate {
    func didPickItems (name: String, image: UIImage)
}

class ProcessorViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var proceedButton: UIButton!
    
    var userName: String? = ""
    var characterPicked: String? = ""
    
    
    var itemsDelegate: DefinedItemsDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.layer.cornerRadius = proceedButton.frame.size.height/2
        
        // Do any additional setup after loading the view.
        userNameLabel.delegate = self
        
    }
    
    @IBAction func characterChosen(_ sender: UIButton) {
        characterPicked = sender.currentTitle!
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        if userNameLabel.text == nil {
            userNameLabel.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.862745098, blue: 0.5333333333, alpha: 1)
            userNameLabel.placeholder = "Please enter username"
        } else {
            if proceedButton.currentTitle != nil {
                itemsDelegate.didPickItems(name: userNameLabel.text!, image: UIImage(named: characterPicked!)!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
//MARK: - UITextFieldDelegate
extension ProcessorViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if userNameLabel.text != "" {
            userName = userNameLabel.text!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if userNameLabel.text != "" {
            userName = userNameLabel.text!
            userNameLabel.resignFirstResponder()
            print(userName!)
            return true
        } else {
            userNameLabel.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.862745098, blue: 0.5333333333, alpha: 1)
            userNameLabel.placeholder = "Please enter username"
            return false
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        userNameLabel.resignFirstResponder()
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        userNameLabel.resignFirstResponder()
    }
    
    
}
