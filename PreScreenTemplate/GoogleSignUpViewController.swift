//
//  GoogleSignUpViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/18/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class GoogleSignUpViewController: UIViewController {
    
    @IBOutlet var signInButton:GIDSignInButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var currentEmail: UILabel!
    
    
    @IBAction func signinTap(_ sender: Any) {
       

    }
    
    @IBAction func signInTouchUpInside(_ sender: Any) {
        emailError.isHidden = true
        currentEmail.isHidden = true
    }
    
    
    @IBAction func enterToPrescreen(_ sender: Any) {
        guard let username = Auth.auth().currentUser?.displayName else {return}
        guard let useremail = Auth.auth().currentUser?.email else {return}
        
        let emailending = String(useremail.suffix(10))
        print (emailending)
        if (emailending == "@dlshs.org") {
            self.performSegue(withIdentifier: "signInToPrescreen", sender: self)
        }
        else {
            emailError.isHidden = false
            currentEmail.text = "Your current email:" + "\n" + useremail
            currentEmail.isHidden = false
            signOutGoogle()
        }
       
    }
    
    func signOutGoogle() {
        GIDSignIn.sharedInstance()?.signOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        
        enterButton.layer.cornerRadius = 20.0;
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
}
