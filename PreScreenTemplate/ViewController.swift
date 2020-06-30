//
//  ViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/17/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//
//  LIST OF ALL SAVED DEFAULTS
//    Key: "UserClear"
//    Key: "UserNotClear"
//    Key: "Q1Yes"
//    Key: "Q2Yes"
//    Key: "Q3Yes"
//    Key: "Q4Yes"
//    Key: "Temperature"
//    Key: "DateSubmitted"
//    Key: "TimeSubmitted"

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func logInPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "LogIn", sender: self)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUp", sender: self)
    }
    
    // Moves forward to student info screen when "Enter" button is pressed
    @IBAction func enterViewButtonPressed(_ sender: Any) {

        let savedDefaults = UserDefaults.standard

        // User has already submitted the form that day and is clear; go to clear screen
        if (savedDefaults.value(forKey: "UserClear") != nil) {
            let clear = savedDefaults.value(forKey: "UserClear") as? Bool
            if (clear!) {
                self.performSegue(withIdentifier: "MainToClear", sender: self)
            }
        }

        // User has already submitted the form that day and is not clear; go to not clear screen
        else if (savedDefaults.value(forKey: "UserNotClear") != nil) {
            let notClear = savedDefaults.value(forKey: "UserNotClear") as? Bool
            if (notClear!) {
                self.performSegue(withIdentifier: "MainToNotClear", sender: self)
            }
        }

        else {
            self.performSegue(withIdentifier: "MainToPrescreen", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("View has loaded")
        enterButton.layer.cornerRadius = 20.0;
        logInButton.layer.cornerRadius = 20.0;
        signUpButton.layer.cornerRadius = 20.0;
        
        let savedDefaults = UserDefaults.standard
        
        // Get the current date
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let currentDate = formatter.string(from: date)             // Produces a string like 01-01-2020
        
        // Check if there is a previous date saved
        if (savedDefaults.value(forKey: "DateSubmitted") == nil || (savedDefaults.value(forKey: "DateSubmitted") as! String) != currentDate) {
           
            // Dates are not the same, clear all previous date's data: Answers to questionnaire, clear/not clear screens, temp entered, date submitted
            savedDefaults.removeObject(forKey: "UserClear")
            savedDefaults.removeObject(forKey: "UserNotClear")
            savedDefaults.removeObject(forKey: "Q1Yes")
            savedDefaults.removeObject(forKey: "Q2Yes")
            savedDefaults.removeObject(forKey: "Q3Yes")
            savedDefaults.removeObject(forKey: "Q4Yes")
            savedDefaults.removeObject(forKey: "Temperature")
            savedDefaults.removeObject(forKey: "DateSubmitted")
            savedDefaults.removeObject(forKey: "TimeSubmitted")
        }
        

        if (Auth.auth().currentUser != nil && Auth.auth().currentUser?.isEmailVerified == true) {
            enterButton.isHidden = false
        } else {
            signUpButton.isHidden = false
            logInButton.isHidden = false
        }

    }
    
    
}

