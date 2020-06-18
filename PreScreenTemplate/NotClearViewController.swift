//
//  NotClearViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/18/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class NotClearViewController: UIViewController {
    
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var yesQuestionsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var feverdeg = String()
    
    var question1 = String()
    var question2 = String()
    var question3 = String()
    var question4 = String()
    // INSERT ADDITIONAL QUESTIONS
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Clear all saved data before going back to questionnaire screen
        let savedDefaults = UserDefaults.standard
        savedDefaults.removeObject(forKey: "FormSubmittedNotClear")
        savedDefaults.removeObject(forKey: "Q1Yes")
        savedDefaults.removeObject(forKey: "Q2Yes")
        savedDefaults.removeObject(forKey: "Q3Yes")
        savedDefaults.removeObject(forKey: "Q4Yes")
        savedDefaults.removeObject(forKey: "TempEntered")
    }

    // Moves backward to questionnaire screen when "Go Back" button is pressed
    @IBAction func backToQuestionnairePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "NotClearToQuestionnaire", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goBackButton.layer.cornerRadius = 10.0
        
        
        let username = Auth.auth().currentUser?.displayName
        if (username != nil){
            nameLabel.text = username
        }
        
        // Load saved data from app for questions answered yes + temperatuer
        let savedDefaults = UserDefaults.standard
        
        if (savedDefaults.value(forKey: "Q1Yes") != nil) {
            question1 = (savedDefaults.value(forKey: "Q1Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q2Yes") != nil) {
            question2 = (savedDefaults.value(forKey: "Q2Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q3Yes") != nil) {
            question3 = (savedDefaults.value(forKey: "Q3Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q4Yes") != nil) {
            question4 = (savedDefaults.value(forKey: "Q4Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "TempEntered") != nil) {
            feverdeg = (savedDefaults.value(forKey: "TempEntered") as? String)!
        }
        
        // Places previously loaded data onto screen
        if (question1 != "") {
            yesQuestionsLabel.text = "\n" + question1 + "\n"
            if ( feverdeg != "") {
                if feverdeg.count > 5 {
                    feverdeg = String(feverdeg.prefix(5))
                }
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "     Reported: " + feverdeg + "\n"
            }
        }
        
        if (question2 != "") {
            yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question2 + "\n"
        }
        if (question3 != "") {
            yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question3 + "\n"
        }
        if (question4 != "") {
            yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question4 + "\n"
        }
        
        let timeSubmitted = savedDefaults.value(forKey: "TimeSubmitted")
        timeLabel.text = timeSubmitted as? String
              
               
        // Get day of week
        let date = Date()
        let calendar = Calendar.current;
        let dayOfWeek = calendar.component(.weekday, from: date)
        var day = ""
        if (dayOfWeek == 1) {
            day = "Sunday"
        }
        else if (dayOfWeek == 2) {
            day = "Monday"
        }
        else if (dayOfWeek == 3) {
            day = "Tuesday"
        }
        else if (dayOfWeek == 4) {
            day = "Wednesday"
        }
        else if (dayOfWeek == 5) {
            day = "Thursday"
        }
        else if (dayOfWeek == 6) {
            day = "Friday"
        }
        else if (dayOfWeek == 7) {
            day = "Saturday"
        }
        
        // Formats date label to Day of Week, Month, Day, Year
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        let form = formatter.string(from: date)
        dateLabel.text = day + ", " + form
    }

}
