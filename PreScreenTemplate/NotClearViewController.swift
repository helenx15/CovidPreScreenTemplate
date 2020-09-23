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

class NotClearViewController: UIViewController {
    
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var yesQuestionsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var temperatureRecorded = String()
    
    // TODO: Change based on # of questions
    var question1 = ""
    var question2 = ""
    var question3 = ""
    var question4 = ""
    var question5 = ""
    var question6 = ""
    var question7 = ""
    var question8 = ""
    var question9 = ""
    var question10 = ""
    var question11 = ""
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Clear all saved data before going back to questionnaire screen
        let savedDefaults = UserDefaults.standard
        savedDefaults.removeObject(forKey: "UserNotClear")
        savedDefaults.removeObject(forKey: "Q1Yes")
        savedDefaults.removeObject(forKey: "Q2Yes")
        savedDefaults.removeObject(forKey: "Q3Yes")
        savedDefaults.removeObject(forKey: "Q4Yes")
        savedDefaults.removeObject(forKey: "Q5Yes")
        savedDefaults.removeObject(forKey: "Q6Yes")
        savedDefaults.removeObject(forKey: "Q7Yes")
        savedDefaults.removeObject(forKey: "Q8Yes")
        savedDefaults.removeObject(forKey: "Q9Yes")
        savedDefaults.removeObject(forKey: "Q10Yes")
        savedDefaults.removeObject(forKey: "Q11Yes")
        savedDefaults.removeObject(forKey: "DateSubmitted")
        savedDefaults.removeObject(forKey: "TimeSubmitted")
    }

    // Moves backward to questionnaire screen when "Go Back" button is pressed
    @IBAction func backToQuestionnairePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "NotClearToPrescreen", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goBackButton.layer.cornerRadius = 10.0
        
        
        let userName = Auth.auth().currentUser?.displayName
        if (userName != nil){
            nameLabel.text = userName
        }
        
        // Load saved data from app for questions answered yes + temperature
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
        if (savedDefaults.value(forKey: "Q5Yes") != nil) {
            question5 = (savedDefaults.value(forKey: "Q5Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q6Yes") != nil) {
            question6 = (savedDefaults.value(forKey: "Q6Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q7Yes") != nil) {
            question7 = (savedDefaults.value(forKey: "Q7Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q8Yes") != nil) {
            question8 = (savedDefaults.value(forKey: "Q8Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q9Yes") != nil) {
            question9 = (savedDefaults.value(forKey: "Q9Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q10Yes") != nil) {
            question10 = (savedDefaults.value(forKey: "Q10Yes") as? String)!
        }
        if (savedDefaults.value(forKey: "Q11Yes") != nil) {
            question11 = (savedDefaults.value(forKey: "Q11Yes") as? String)!
        }
        
        if (question1 == "" && question2 == "" && question3 == "" && question4 == "" && question5 == "" && question6 == "" && question7 == "" && question8 == "" && question9 == "" && question10 == "" && question11 == "") {
                   yesQuestionsLabel.text = "\n" + "None" + "\n"
        }
        
        else {
        
        // Places previously loaded data onto screen
            if (question1 != "") {
                yesQuestionsLabel.text = "\n" + question1 + "\n"
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
            if (question5 != "") {
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question5 + "\n"
            }
            if (question6 != "") {
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question6 + "\n"
            }
            if (question7 != "") {
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question7 + "\n"
            }
            if (question8 != "") {
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question8 + "\n"
            }
            if (question9 != "") {
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question9 + "\n"
            }
            if (question10 != "") {
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question10 + "\n"
            }
            if (question11 != "") {
                yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + question11 + "\n"
            }
        }
        
        if ( temperatureRecorded != "") {
            if temperatureRecorded.count > 5 {
                temperatureRecorded = String(temperatureRecorded.prefix(5))
            }
            yesQuestionsLabel.text = yesQuestionsLabel.text! + "\n" + "Temp Reported: " + temperatureRecorded + " °F" + "\n"
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
        let formattedDate = formatter.string(from: date)
        dateLabel.text = day + ", " + formattedDate              // Produces a string like Thursday, May 7, 2020
    }

}
