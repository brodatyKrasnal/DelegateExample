//
//  ViewController.swift
//  DelegateExample
//
//  Created by Daniel Golęba Frygies on 09/04:100.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
// intern

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var topPicture: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var catchButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catchButton.layer.cornerRadius = catchButton.frame.size.height/2
    }
    
    @IBAction func catchEmButtonPressed(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "goForward", sender: self)
        
        let selectedVC = storyboard?.instantiateViewController(identifier: "SelectionScreen") as! ProcessorViewController
        selectedVC.itemsDelegate = self
        present(selectedVC, animated: true, completion: nil)
    }
    
}

extension FirstViewController: DefinedItemsDelegate {
    func didPickItems(name: String, image: UIImage) {
        usernameLabel.text = name
        topPicture.image = image
    }
    
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "goForward" {
    //            let controller = segue.destination as! ProcessorViewController
    //    //
    //        }
    //    }
    
    
}

