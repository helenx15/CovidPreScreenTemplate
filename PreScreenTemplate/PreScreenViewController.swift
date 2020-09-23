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
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var question1Prompt: UILabel!
    @IBOutlet weak var question2Prompt: UILabel!
    @IBOutlet weak var question3Prompt: UILabel!
    @IBOutlet weak var question4Prompt: UILabel!
    @IBOutlet weak var question5Prompt: UILabel!
    @IBOutlet weak var question6Prompt: UILabel!
    @IBOutlet weak var question7Prompt: UILabel!
    @IBOutlet weak var question8Prompt: UILabel!
    @IBOutlet weak var question9Prompt: UILabel!
    @IBOutlet weak var question10Prompt: UILabel!
    @IBOutlet weak var question11Prompt: UILabel!

    // INSERT ADDITIONAL QUESTIONS HERE
    
    @IBOutlet weak var question1Yes: UIButton!
    @IBOutlet weak var question1No: UIButton!
    @IBOutlet weak var question2Yes: UIButton!
    @IBOutlet weak var question2No: UIButton!
    @IBOutlet weak var question3Yes: UIButton!
    @IBOutlet weak var question3No: UIButton!
    @IBOutlet weak var question4Yes: UIButton!
    @IBOutlet weak var question4No: UIButton!
    @IBOutlet weak var question5Yes: UIButton!
    @IBOutlet weak var question5No: UIButton!
    @IBOutlet weak var question6Yes: UIButton!
    @IBOutlet weak var question6No: UIButton!
    @IBOutlet weak var question7Yes: UIButton!
    @IBOutlet weak var question7No: UIButton!
    @IBOutlet weak var question8Yes: UIButton!
    @IBOutlet weak var question8No: UIButton!
    @IBOutlet weak var question9Yes: UIButton!
    @IBOutlet weak var question9No: UIButton!
    @IBOutlet weak var question10Yes: UIButton!
    @IBOutlet weak var question10No: UIButton!
    @IBOutlet weak var question11Yes: UIButton!
    @IBOutlet weak var question11No: UIButton!

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
    
// Radio buttons for Question 5
    @IBAction func question5YesSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question5No.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question5No.isSelected = false
               }
    }
    
    @IBAction func question5NoSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question5Yes.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question5Yes.isSelected = false
               }
    }
 
// Radio buttons for Question 6
    @IBAction func question6YesSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question6No.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question6No.isSelected = false
               }
    }
    
    @IBAction func question6NoSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question6Yes.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question6Yes.isSelected = false
               }
    }
    
// Radio buttons for Question 7
    @IBAction func question7YesSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question7No.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question7No.isSelected = false
               }
    }
    
    @IBAction func question7NoSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question7Yes.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question7Yes.isSelected = false
               }
    }
    
// Radio buttons for Question 8
    @IBAction func question8YesSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question8No.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question8No.isSelected = false
               }
    }
    
    @IBAction func question8NoSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question8Yes.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question8Yes.isSelected = false
               }
    }
    
// Radio buttons for Question 9
    @IBAction func question9YesSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question9No.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question9No.isSelected = false
               }
    }
    
    @IBAction func question9NoSelected(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
                   question9Yes.isSelected = false
               }
               else {
                   sender.isSelected = true
                   question9Yes.isSelected = false
               }
    }
    
    // Radio buttons for Question 10
       @IBAction func question10YesSelected(_ sender: UIButton) {
           if sender.isSelected {
               sender.isSelected = false
               question10No.isSelected = false
           }
           else {
               sender.isSelected = true
               question10No.isSelected = false
           }
       }
       
       @IBAction func question10NoSelected(_ sender: UIButton) {
           if sender.isSelected {
               sender.isSelected = false
               question10Yes.isSelected = false
           }
           else {
               sender.isSelected = true
               question10Yes.isSelected = false
           }
       }
    
    // Radio buttons for Question 11
       @IBAction func question11YesSelected(_ sender: UIButton) {
           if sender.isSelected {
               sender.isSelected = false
               question11No.isSelected = false
           }
           else {
               sender.isSelected = true
               question11No.isSelected = false
           }
       }
       
       @IBAction func question11NoSelected(_ sender: UIButton) {
           if sender.isSelected {
               sender.isSelected = false
               question11Yes.isSelected = false
           }
           else {
               sender.isSelected = true
               question11Yes.isSelected = false
           }
       }
    
    
    @IBAction func covidLink(_ sender: Any) {
           UIApplication.shared.open(URL(string:"https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/symptoms.html?CDC_AA_refVal=https%3A%2F%2Fwww.cdc.gov%2Fcoronavirus%2F2019-ncov%2Fabout%2Fsymptoms.html")! as URL, options: [:], completionHandler: nil)
       }
    
    // INSERT ADDITIONAL QUESTIONS HERE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Creates save default so app can save all information from questionnaire
        let savedDefaults = UserDefaults.standard
        
        // Info for Clear Screen
        if segue.identifier == "ClearSegue" {
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
            if (question5Yes.isSelected)
            {
                savedDefaults.set(question5Prompt.text!, forKey: "Q5Yes")
            }
            if (question6Yes.isSelected)
            {
                savedDefaults.set(question6Prompt.text!, forKey: "Q6Yes")
            }
            if (question7Yes.isSelected)
            {
                savedDefaults.set(question7Prompt.text!, forKey: "Q7Yes")
            }
            if (question8Yes.isSelected)
            {
                savedDefaults.set(question8Prompt.text!, forKey: "Q8Yes")
            }
            if (question9Yes.isSelected)
            {
                savedDefaults.set(question9Prompt.text!, forKey: "Q9Yes")
            }
            if (question10Yes.isSelected)
            {
                savedDefaults.set(question10Prompt.text!, forKey: "Q10Yes")
            }
            if (question11Yes.isSelected)
            {
                savedDefaults.set(question11Prompt.text!, forKey: "Q11Yes")
            }
            savedDefaults.set(true, forKey: "UserNotClear")
        }
        
        // Info for both Clear and Not Clear screens AKA Submit Button Validly Pressed
        if (segue.identifier == "NotClearSegue" || segue.identifier == "ClearSegue") {
            
            guard let userName = Auth.auth().currentUser?.displayName else {return}
            guard let userEmail = Auth.auth().currentUser?.email else {return}
            
            var q1Answer = "No"
            var q2Answer = "No"
            var q3Answer = "No"
            var q4Answer = "No"
            var q5Answer = "No"
            var q6Answer = "No"
            var q7Answer = "No"
            var q8Answer = "No"
            var q9Answer = "No"
            var q10Answer = "No"
            var q11Answer = "No"
            
            if (question1Yes.isSelected) {
                q1Answer = "Yes"
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
            if (question5Yes.isSelected) {
                q5Answer = "Yes"
            }
            if (question6Yes.isSelected) {
                q6Answer = "Yes"
            }
            if (question7Yes.isSelected) {
                q7Answer = "Yes"
            }
            if (question8Yes.isSelected) {
                q8Answer = "Yes"
            }
            if (question9Yes.isSelected) {
                q9Answer = "Yes"
            }
            if (question10Yes.isSelected) {
                q10Answer = "Yes"
            }
            if (question11Yes.isSelected) {
                q11Answer = "Yes"
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
            
            var root = ""
            let adjustedEmail = userEmail.replacingOccurrences(of: ".", with: ",")
            
            // For those added manually
            if (userEmail == userName) {
                root = adjustedEmail
            }
            else {
                root = userName + "; " + adjustedEmail
            }
            
            self.ref.child(root).child(currentDate).child("COVID Contact").setValue(q1Answer)
            self.ref.child(root).child(currentDate).child("Fever").setValue(q2Answer)
            self.ref.child(root).child(currentDate).child("Cough or Sore Throat").setValue(q3Answer)
            self.ref.child(root).child(currentDate).child("Shortness of Breath").setValue(q4Answer)
            self.ref.child(root).child(currentDate).child("Chills").setValue(q5Answer)
            self.ref.child(root).child(currentDate).child("Muscle Pain").setValue(q6Answer)
            self.ref.child(root).child(currentDate).child("Headache").setValue(q7Answer)
            self.ref.child(root).child(currentDate).child("Nausia or Vomiting or Diarrhea").setValue(q8Answer)
            self.ref.child(root).child(currentDate).child("Loss of Taste or Smell").setValue(q9Answer)
            self.ref.child(root).child(currentDate).child("Fatigue").setValue(q10Answer)
            self.ref.child(root).child(currentDate).child("Congestion or Runny Nose").setValue(q11Answer)
            self.ref.child(root).child(currentDate).child("Timestamp").setValue(timestamp)
            
            self.ref.child(currentDate).child(root).child("COVID Contact").setValue(q1Answer)
            self.ref.child(currentDate).child(root).child("Fever").setValue(q2Answer)
            self.ref.child(currentDate).child(root).child("Cough or Sore Throat").setValue(q3Answer)
            self.ref.child(currentDate).child(root).child("Shortness of Breath").setValue(q4Answer)
            self.ref.child(currentDate).child(root).child("Chills").setValue(q5Answer)
            self.ref.child(currentDate).child(root).child("Muscle Pain").setValue(q6Answer)
            self.ref.child(currentDate).child(root).child("Headache").setValue(q7Answer)
            self.ref.child(currentDate).child(root).child("Nausia or Vomiting or Diarrhea").setValue(q8Answer)
            self.ref.child(currentDate).child(root).child("Loss of Taste or Smell").setValue(q9Answer)
            self.ref.child(currentDate).child(root).child("Fatigue").setValue(q10Answer)
            self.ref.child(currentDate).child(root).child("Congestion or Runny Nose").setValue(q11Answer)
            self.ref.child(currentDate).child(root).child("timestamp").setValue(timestamp)
        }
    }
    
     // Moves forward to all clear screen when "Submit" button is pressed
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        // Checks if all questions have been answered
        if ((question1Yes.isSelected || question1No.isSelected) && (question2Yes.isSelected || question2No.isSelected) && (question3Yes.isSelected || question3No.isSelected) && (question4Yes.isSelected || question4No.isSelected) && (question5Yes.isSelected || question5No.isSelected) && (question6Yes.isSelected || question6No.isSelected) && (question7Yes.isSelected || question7No.isSelected) && (question8Yes.isSelected || question8No.isSelected) && (question9Yes.isSelected || question9No.isSelected) && (question10Yes.isSelected || question10No.isSelected) && (question11Yes.isSelected || question11No.isSelected))
        {
            // All questions answered
            
            // CLEAR: Qs 1-9 No
            
            if (question1No.isSelected && question2No.isSelected && question3No.isSelected && question4No.isSelected && question5No.isSelected && question6No.isSelected && question7No.isSelected && question8No.isSelected && question9No.isSelected && question10No.isSelected && question11No.isSelected)
            {
                self.performSegue(withIdentifier: "ClearSegue", sender: self)
            }
            
            // NOT CLEAR: At least 1 Q answered yes
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
    
//    // Closes keyboard when user touches outside of the keyboard
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//
//    // Closes keyboard when user touches return key (Not present in decimal keyboard, but keeping in case switch back)
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        ref = Database.database().reference()
        
        viewMyInfoButton.layer.cornerRadius = 10.0
        submitButton.layer.cornerRadius = 20.0
    }

    
}
