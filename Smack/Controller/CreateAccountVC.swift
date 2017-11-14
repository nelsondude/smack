//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Alexander Nelson on 11/8/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        guard let pass = passTxt.text, passTxt.text != "" else {
            return
        }
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if (success) {
                print("Registered User")
            }
        }
    }
    
}
