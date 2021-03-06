//
//  InfoViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/18/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class InfoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var fullNameTitleLabel: UILabel!
    @IBOutlet weak var emailAddressTitleLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    @IBAction func signOutTap(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.performSegue(withIdentifier: "SignOutSegue", sender: self)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
   
    // Moves forward to questionnaire screen when "Continue" button is pressed
    @IBAction func continueButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "InfoToPrescreen", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextButton.layer.cornerRadius = 20.0;
        signOutButton.layer.cornerRadius = 10.0;
        
        guard let username = Auth.auth().currentUser?.displayName else {return}
        guard let useremail = Auth.auth().currentUser?.email else {return}
        
        if (username == useremail) {
            emailAddressLabel.isHidden = true
            emailAddressTitleLabel.isHidden = true
            fullNameTitleLabel.text = "Email"
        }
        
        fullNameLabel.text = username
        emailAddressLabel.text = useremail
    }
    
    
}
