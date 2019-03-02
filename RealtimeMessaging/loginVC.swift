//
//  ViewController.swift
//  RealtimeMessaging
//
//  Created by Paul Jia on 3/2/19.
//  Copyright © 2019 Paul Jia. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper
import FirebaseAuth

class loginVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signIn (_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text{
            Auth.auth()?.signIn(withEmail: email, password: password, completion:
                { (user, error) in
                    if error = nil {
                        self.userUid = user?.uid
                        KeychainWrapper.standard.set(self.userUid, forKey: "uid")
                        performSegue(withIdentifier: "toMessages", sender: nil)
                    } else {
                        performSegue(withIdentifier: "toSignUp", sender: nil)
                    }
                    
            })
        }
    }
}

