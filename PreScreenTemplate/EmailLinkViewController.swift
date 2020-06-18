//
//  EmailLinkViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/18/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class EmailLinkViewController: UIViewController {

    @IBOutlet weak var emailtextfield: UITextField!
    var link: String!
    
    @IBAction func sendLinkTapped(_ sender: Any) {
        if let email = emailtextfield.text {
            let actioncodesettings = ActionCodeSettings()
            actioncodesettings.handleCodeInApp = true
            actioncodesettings.url = URL.init(string: String(format: "https://dls-covid-app.firebaseapp.com/?email=%@", email))
            actioncodesettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
            
            Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actioncodesettings, completion: { (err) in
                if let e = err {
                    print ("email not sent")
                    print (e.localizedDescription)
                } else {
                    print ("email sent")
                }
            })
        }
    }
    
    @IBAction func signInTapped(_ sender: AnyObject) {
        print("at least the dang button works")
        if let link = UserDefaults.standard.value(forKey: "Link") as? String{
            print("the link exists! a miracle")
            self.link = link
        }
        print ("and this is where we crash")
        Auth.auth().signIn(withEmail: emailtextfield.text!, link: link) { (result, error) in
            if error == nil && result != nil {
                if (Auth.auth().currentUser?.isEmailVerified)!{
                    print("User verified")
                } else {
                    print ("User not verified")
                }
            } else {
                print (error?.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
