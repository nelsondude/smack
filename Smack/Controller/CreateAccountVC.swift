//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Alexander Nelson on 11/8/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
