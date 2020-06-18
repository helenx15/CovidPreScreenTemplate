//
//  SignUpViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/17/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var emailSentLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func signUpPressed(_ sender: Any) {
        let name = nameInput.text!
        let email = emailInput.text!
        let password = passwordInput.text!
        
        if (name == nil || email == nil || password == nil || name == "" || email == "" || password == "") {
            self.emailSentLabel.text = "Please fill out all entries."
            self.emailSentLabel.isHidden = false
        } else if (password.count < 6) {
            self.emailSentLabel.text = "Your password needs to be at least 6 characters."
            self.emailSentLabel.isHidden = false
        } else if (email.suffix(10) != "@dlshs.org") {
            self.emailSentLabel.text = "Please sign up with a De La Salle Email."
            self.emailSentLabel.isHidden = false
            
        } else {
            // TODO: CHECK IF EMAIL ENDS IN DLS
            self.emailSentLabel.text = "Please wait while we create your account..."
            self.emailSentLabel.isHidden = false
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if (error != nil) {
                    self.emailSentLabel.text = "Error: User already exists or one or more entries are invalid. Try again, or:"
                    self.logInButton.isHidden = false
                    return
                } else {
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = name
                    changeRequest?.commitChanges { (error) in
                        if (error != nil) {
                            self.emailSentLabel.text = "Error: Unable to save name."
                        }
                    }
                    Auth.auth().currentUser?.sendEmailVerification { (error) in
                        if (error != nil) {
                            self.emailSentLabel.text = "Unable to send verification email. Try again, or try a different email."
                            
                        } else {
                            self.emailSentLabel.text = "A verification email has been sent to your email. Please verify your account then log in."
                        }
                    }
//                    // Sign users out
//                    let firebaseAuth = Auth.auth()
//                    do {
//                        try firebaseAuth.signOut()
//                    } catch let signOutError as NSError {
//                      print ("Error signing out: %@", signOutError)
//                    }
                }
            }
        }
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpToLogIn", sender: self)
    }
    
    //Keyboard functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
        self.nameInput.delegate = self
        self.emailInput.delegate = self
        self.passwordInput.delegate = self
        
        signUpButton.layer.cornerRadius = 20.0;
        logInButton.layer.cornerRadius = 20.0;
    }
    

}
