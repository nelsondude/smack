//
//  LoginVC.swift
//  Smack
//
//  Created by Alexander Nelson on 11/8/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {return}
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
//                self.performSegue(withIdentifier: UNWIND, sender: nil)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
