//
//  ViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/17/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//
//  LIST OF ALL SAVED DEFAULTS
//    Key: "FormSubmittedClear"
//    Key: "FormSubmittedNotClear"
//    Key: "Q1Yes"
//    Key: "Q2Yes"
//    Key: "Q3Yes"
//    Key: "Q4Yes"
//    Key: "TempEntered"
//    Key: "DateSubmitted"
//    Key: "TimeSubmitted"

import UIKit
import GoogleSignIn
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var enterbutton: UIButton!
    
    @IBAction func logInPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "LogIn", sender: self)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "CreateAccount", sender: self)
    }
    
    // Moves forward to student info screen when "Enter" button is pressed
    @IBAction func enterViewButtonPressed(_ sender: Any) {
        
        
//        if (Auth.auth().currentUser?.email == nil) {
//            self.performSegue(withIdentifier: "CreateAccount", sender: self)
//        }
//
//        else if ((Auth.auth().currentUser?.isEmailVerified) != nil) {
//            self.performSegue(withIdentifier: "EnterToPrescreen", sender: self)
//        }
//        else {
//            self.performSegue(withIdentifier: "CreateAccount", sender: self)
//        }
//
//        self.performSegue(withIdentifier: "CreateAccount", sender: self)
        
//        self.performSegue(withIdentifier: "MainToEmailLink", sender: self)
//
//        let username = Auth.auth().currentUser?.displayName
//        let useremail = Auth.auth().currentUser?.email
//        var emailending = ""
//        if (useremail != nil) {
//            emailending = String(useremail!.suffix(10))
//        }

        let savedDefaults = UserDefaults.standard

//        // If not signed in then go to sign in screen
//        if (username == nil || useremail == nil || emailending != "@dlshs.org") {
//            self.performSegue(withIdentifier: "mainToGoogle", sender: self)
//        }

        // If code reaches here, it means that there is a user logged in, and the user's email ends in @dlshs.org

//        // New day, previous day's contents already cleared
//        if (savedDefaults.value(forKey: "DateSubmitted") == nil) {
//            self.performSegue(withIdentifier: "EnterToPrescreen", sender: self)
//        }

        // User has already submitted the form that day and is clear; go to clear screen
        if (savedDefaults.value(forKey: "FormSubmittedClear") != nil) {
            let clear = savedDefaults.value(forKey: "FormSubmittedClear") as? Bool
            if (clear!) {
                self.performSegue(withIdentifier: "EnterClear", sender: self)
            }
        }

        // User has already submitted the form that day and is not clear; go tot he not clear screen
        else if (savedDefaults.value(forKey: "FormSubmittedNotClear") != nil) {
            let notclear = savedDefaults.value(forKey: "FormSubmittedNotClear") as? Bool
            if (notclear!) {
                self.performSegue(withIdentifier: "EnterNotClear", sender: self)
            }
        }

        else {
            self.performSegue(withIdentifier: "EnterToPrescreen", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("View has loaded")
        enterbutton.layer.cornerRadius = 20.0;
        logInButton.layer.cornerRadius = 20.0;
        signUpButton.layer.cornerRadius = 20.0;
        
        let savedDefaults = UserDefaults.standard
        
        // Get the current date
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let currentdate = formatter.string(from: date)             // Produces a string like 01-01-2020
        
        // Check if there is a previous date saved
        if (savedDefaults.value(forKey: "DateSubmitted") == nil || (savedDefaults.value(forKey: "DateSubmitted") as! String) != currentdate) {
            // There is a previous date saved; load previous date
//            let previousdate = savedDefaults.value(forKey: "DateSubmitted") as! String
//
//            if (currentdate != previousdate) {
                
            // Dates are not the same, clear all previous date's data: Answers to questionnaire, clear/not clear screens, temp entered, date submitted
            savedDefaults.removeObject(forKey: "FormSubmittedClear")
            savedDefaults.removeObject(forKey: "FormSubmittedNotClear")
            savedDefaults.removeObject(forKey: "Q1Yes")
            savedDefaults.removeObject(forKey: "Q2Yes")
            savedDefaults.removeObject(forKey: "Q3Yes")
            savedDefaults.removeObject(forKey: "Q4Yes")
            savedDefaults.removeObject(forKey: "TempEntered")
            savedDefaults.removeObject(forKey: "DateSubmitted")
            savedDefaults.removeObject(forKey: "TimeSubmitted")
 //           }
        }
        

        if (Auth.auth().currentUser != nil && Auth.auth().currentUser?.isEmailVerified == true) {
            enterbutton.isHidden = false
        } else {
            signUpButton.isHidden = false
            logInButton.isHidden = false
        }

    }
    
    
}

