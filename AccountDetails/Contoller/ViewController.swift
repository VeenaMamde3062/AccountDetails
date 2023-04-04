//
//  ViewController.swift
//  AccountDetails
//
//  Created by user235115 on 4/3/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nameField(_ sender: UITextField) {
        self.performSegue(withIdentifier: "FinalView", sender: self)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.performSegue(withIdentifier: "FinalView", sender: self)
    }
    
}

