//
//  InfoViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/18/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//


import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class InfoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    @IBAction func signOutTap(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.performSegue(withIdentifier: "signOutToMain", sender: self)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
   
    // Moves forward to questionnaire screen when "Continue" button is pressed
    @IBAction func continueButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "QuestionViewSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextButton.layer.cornerRadius = 20.0;
        signOutButton.layer.cornerRadius = 10.0;
        
        guard let username = Auth.auth().currentUser?.displayName else {return}
        guard let useremail = Auth.auth().currentUser?.email else {return}
        fullNameLabel.text = username
        emailAddressLabel.text = useremail
    }
    
    
}
