//
//  PreScreenViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/17/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class PreScreenViewController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var viewMyInfoButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var temperatureInput: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var question1Prompt: UILabel!
    @IBOutlet weak var question2Prompt: UILabel!
    @IBOutlet weak var question3Prompt: UILabel!
    @IBOutlet weak var question4Prompt: UILabel!
    // INSERT ADDITIONAL QUESTIONS HERE
    
    @IBOutlet weak var question1Yes: UIButton!
    @IBOutlet weak var question1No: UIButton!
    @IBOutlet weak var question2Yes: UIButton!
    @IBOutlet weak var question2No: UIButton!
    @IBOutlet weak var question3Yes: UIButton!
    @IBOutlet weak var question3No: UIButton!
    @IBOutlet weak var question4Yes: UIButton!
    @IBOutlet weak var question4No: UIButton!
    // INSERT ADDITIONAL QUESTIONS HERE
    
    var ref: DatabaseReference!
    
// Radio buttons for Question 1
    @IBAction func question1YesSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            question1No.isSelected = false
        }
        else {
            sender.isSelected = true
            question1No.isSelected = false
        }
    }
    
    @IBAction func question1NoSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            question1Yes.isSelected = false
        }
        else {
            sender.isSelected = true
            question1Yes.isSelected = false
        }
    }
 
// Radio buttons for Question 2
    @IBAction func question2YesSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            question2No.isSelected = false
        }
        else {
            sender.isSelected = true
            question2No.isSelected = false
        }
    }
    
    @IBAction func question2NoSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            question2Yes.isSelected = false
        }
        else {
            sender.isSelected = true
            question2Yes.isSelected = false
        }
    }

// Radio buttons for Question 3
    @IBAction func question3YesSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            question3No.isSelected = false
        }
        else {
            sender.isSelected = true
            question3No.isSelected = false
        }
    }
    
    @IBAction func question3NoSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            question3Yes.isSelected = false
        }
        else {
            sender.isSelected = true
            question3Yes.isSelected = false
        }
    }
    
// Radio buttons for Question 4
    @IBAction func question4YesSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            question4No.isSelected = false
        }
        else {
            sender.isSelected = true
            question4No.isSelected = false
        }
    }
    
    @IBAction func question4NoSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question4Yes.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question4Yes.isSelected = false
               }
    }
    
    // INSERT ADDITIONAL QUESTIONS HERE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Creates save default so app can save all information from questionnaire
        let savedDefaults = UserDefaults.standard
        
        // Info for Clear Screen
        if segue.identifier == "ClearSegue" {
            if (temperatureInput.text! != "") {
                savedDefaults.set(temperatureInput.text!, forKey: "Temperature")
            }
            savedDefaults.set(true, forKey: "UserClear")
        }
        
        // Info for Not Clear Screen
        else if segue.identifier == "NotClearSegue" {
            if (question1Yes.isSelected)
            {
                savedDefaults.set(question1Prompt.text!, forKey: "Q1Yes")
            }
            if (question2Yes.isSelected)
            {
                savedDefaults.set(question2Prompt.text!, forKey: "Q2Yes")
            }
            if (question3Yes.isSelected)
            {
                savedDefaults.set(question3Prompt.text!, forKey: "Q3Yes")
            }
            if (question4Yes.isSelected)
            {
                savedDefaults.set(question4Prompt.text!, forKey: "Q4Yes")
            }
            if (temperatureInput.text! != "") {
                savedDefaults.set(temperatureInput.text! + " °F", forKey: "Temperature")
            }
            savedDefaults.set(true, forKey: "UserNotClear")
        }
        
        // Info for both Clear and Not Clear screens AKA Submit Button Validly Pressed
        if (segue.identifier == "NotClearSegue" || segue.identifier == "ClearSegue") {
            
            guard let userName = Auth.auth().currentUser?.displayName else {return}
            guard let userEmail = Auth.auth().currentUser?.email else {return}
            
            var feverTemp = ""
            var q1Answer = "No"
            var q2Answer = "No"
            var q3Answer = "No"
            var q4Answer = "No"
            
            if (savedDefaults.value(forKey: "Temperature") != nil) {
                feverTemp = (savedDefaults.value(forKey: "Temperature") as? String)!
            }
            
            if (question1Yes.isSelected) {
                q1Answer = "Yes"
            }
            if (feverTemp != "") {
                q1Answer = q1Answer + " " + feverTemp
            }
            if (question2Yes.isSelected) {
                q2Answer = "Yes"
            }
            if (question3Yes.isSelected) {
                q3Answer = "Yes"
            }
            if (question4Yes.isSelected) {
                q4Answer = "Yes"
            }
            
            // Date and Time info
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            let currentDate = formatter.string(from: date)             // Produces a string like 01-01-2020
            let formatter2 = DateFormatter()
            formatter2.timeStyle = .medium
            let timestamp = formatter2.string(from: date)
            
            // Save the current day to app
            savedDefaults.set(currentDate, forKey: "DateSubmitted")
            savedDefaults.set(timestamp, forKey: "TimeSubmitted")

            // Data sent to firebase
            self.ref.child(userName).child("email").setValue(userEmail)
            
            self.ref.child(userName).child(currentDate).child("question1").setValue(q1Answer)
            self.ref.child(userName).child(currentDate).child("question2").setValue(q2Answer)
            self.ref.child(userName).child(currentDate).child("question3").setValue(q3Answer)
            self.ref.child(userName).child(currentDate).child("question4").setValue(q4Answer)
            self.ref.child(userName).child(currentDate).child("timestamp").setValue(timestamp)
        }
    }
    
     // Moves forward to all clear screen when "Submit" button is pressed
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        // Checks if all questions have been answered
        if ((question1Yes.isSelected || question1No.isSelected) && (question2Yes.isSelected || question2No.isSelected) && (question3Yes.isSelected || question3No.isSelected) && (question4Yes.isSelected || question4No.isSelected))
        {
            // All questions answered
        
            // Get the temperature
            let temperatureInt = Double(temperatureInput.text!)
            
            // CLEAR: Qs 2-4 No + No fever / Fever < 100.4
            if ((question2No.isSelected && question3No.isSelected && question4No.isSelected) && ((question1No.isSelected) || (temperatureInput.text! != "" && temperatureInt!.isLess(than: 100.4))))
            {
                self.performSegue(withIdentifier: "ClearSegue", sender: self)
            }
            
            // NOT CLEAR: At least 1 Q answered yes / fever >= 100.4
            else {
                self.performSegue(withIdentifier: "NotClearSegue", sender: self)
            }
        }
            
        // Not all quetsions were answered
        else
        {
            errorLabel.isHidden = false
        }
    }
    
    // Moves backward to student info screen when "Back" button is pressed
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "ViewInfo", sender: self)
    }
    
    // Closes keyboard when user touches outside of the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
       
    // Closes keyboard when user touches return key (Not present in decimal keyboard, but keeping in case switch back)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        ref = Database.database().reference()
        
        temperatureInput.delegate = self
        viewMyInfoButton.layer.cornerRadius = 10.0
        submitButton.layer.cornerRadius = 20.0
    }

    
}
