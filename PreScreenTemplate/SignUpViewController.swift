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
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        
        let name = nameInput.text!.trimmingCharacters(in: .whitespaces)
        let email = emailInput.text!
        let password = passwordInput.text!
        
        if (name == nil || email == nil || password == nil || name == "" || email == "" || password == "") {
            self.signUpLabel.text = "Please fill out all entries."
            self.signUpLabel.isHidden = false
        } else if (!name.contains(" ")){
            self.signUpLabel.text = "Please enter your first and last name."
            self.signUpLabel.isHidden = false
        //TODO: Replace with school
//        } else if (email.suffix(14) != "@schoolemailending.org") {
//            self.signUpLabel.text = "Please sign up with a INSERT SCHOOL NAME HERE email."
//            self.signUpLabel.isHidden = false
        } else if (password.count < 6) {
            self.signUpLabel.text = "Your password needs to be at least 6 characters."
            self.signUpLabel.isHidden = false
        } else {
            self.signUpLabel.text = "Please wait while we create your account..."
            self.signUpLabel.isHidden = false
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if (error != nil) {
                    self.signUpLabel.text = "Error: User already exists or one or more entries are invalid. Try again, or:"
                    self.logInButton.isHidden = false
                    return
                } else {
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = name
                    changeRequest?.commitChanges { (error) in
                        if (error != nil) {
                            self.signUpLabel.text = "Error: Unable to save name."
                        }
                    }
                    Auth.auth().currentUser?.sendEmailVerification { (error) in
                        if (error != nil) {
                            self.signUpLabel.text = "Unable to send verification email. Try again, or try a different email."
                            
                        } else {
                            self.signUpLabel.text = "A verification email has been sent to your email. Please verify your account then log in."
                        }
                    }
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
