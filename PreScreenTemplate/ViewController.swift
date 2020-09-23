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
    
    let termsAndConditions = "End User Licensing Agreement (EULA) License Grant. Blue Devil Apps, LLC grants You a revocable, non-exclusive, non-transferable, limited right to install and use the Application on a single Mobile Device owned and controlled by You, and to access and use the Application on such Mobile Device strictly in accordance with the terms and conditions of this License, the Usage Rules and any service agreement associated with your Mobile Device (collectively “Related Agreements”). Restrictions on Use. You shall use the Application strictly in accordance with the terms of the Related Agreements and shall not: (a) decompile, reverse engineer, disassemble, attempt to derive the source of code of, or decrypt the Application; (b) make any modification, adaptation, improvement enhancement, translation or derivative work from the Application; (c) violate any applicable laws, rules or regulations in connection with Your access or use of the Application; (d) remove, alter or obscure any proprietary notice (including any notice of copyright and trademark) of Blue Devil Apps, LLC or its affiliates, partners, suppliers or the licensors of the Application; (e) use the Application for any reverse generating endeavor, commercial enterprise, or the purpose for which it is not designed or intended; (f) install, use or permit the Application to exist on more than one Mobile Device at a time or on any mobile device or computer; (g) distribute the application to multiple mobile devices; (h) make the Application available over a network or other environment permitting access or use by multiple Mobile Devices or users at the same time; (i) use the Application for creating a product, service or software that is, directly or indirectly, competitive with any or in any way substitute for any services, product or software offered by Blue Devil Apps, LLC; (j) use the Application to send automated queries to any website or to send any unsolicited commercial e-mail; or (k) use any proprietary information or interfaces of Blue Devil Apps, LLC or other intellectual property of Blue Devil Apps, LLC in the design, development, manufacture, licensing or distribution of any applications, accessories or devices for use with the Application. Infringement Acknowledgement. You and Blue Devil Apps, LLC acknowledge and agree that, in the event of a third party claim that the Application or Your possession or use of the Application infringes any third party’s intellectual property rights, You (and not Blue Devil Apps, LLC) will be responsible for the investigation defense, settlement and discharge of any such claim of intellectual property infringement.  You will, however, promptly notify Blue Devil Apps, LLC in writing of such a claim. Termination.  Blue Devil Apps, LLC may, in its sole and absolute discretion, at any time and for any reason, suspend or terminate this License and the rights afforded to You hereunder with or without prior notice.  Furthermore, if You fail to comply with any terms and conditions of the License, then this License and any right afforded to You hereunder shall terminate automatically, without any notice or other action by Blue Devil Apps, LLC. Upon the termination of this License, You shall cease all use of the Application and uninstall the Application. Disclaimer of Warranties. You acknowledge and agree that the Application is provided on an “As Is” and “As Available” basis, and that your use of or reliance upon the Application and any third party content and services accessed thereby is at your sole risk and discretion.  Blue Devil Apps, LLC and its affiliates, partners, suppliers and licensors hereby disclaim any and all representations, warranties and guaranties regarding the Application and third party content and services, whether express, implied or statutory, and including without limitation, the implied warranties of merchantability, fitness for a particular purpose, and non-infringement.  Furthermore, Blue Devil Apps, LLC and its affiliates, partners, suppliers and licensors make on warranty that (I) The Application or third party content and services will meet your requirements; (II) The Application or third party content and services will be interrupted, accurate, reliable, timely secure or error-free; (III) The quality of any products, services, information or other material accessed or obtained by you through the Application will be as represented or meet your expectations; or (IV) Any errors in the application or third party content and services will be corrected.  No advice or information, whether oral or written, obtained by you from Blue Devil Apps, LLC or from the Application shall create any Limitation of Liability. Under no circumstances shall Blue Devil Apps, LLC or its affiliates, partners, suppliers, or licensors be liable for any indirect, incidental, consequential, special or exemplary damages arising out of or in connection with your access or use of or inability to access or use the Application and any third party content and services, whether or not the damages were foreseeable and whether or not Blue Devil Apps, LLC was advised of the possibility of such damages.  Without limiting the generality of the foregoing, Blue Devil Apps, LLC aggregate liability to you (whether under contract, tort, statute or otherwise) shall not exceed the amount of fifty dollars ($50.00).  The foregoing limitations will apply even if the above stated remedy fails of its essential purpose."
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var termsError: UILabel!
    
    @IBAction func logInPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "LogIn", sender: self)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUp", sender: self)
    }
    
    // Moves forward to student info screen when "Enter" button is pressed
    @IBAction func enterViewButtonPressed(_ sender: Any) {

        let savedDefaults = UserDefaults.standard
        if (savedDefaults.value(forKey: "AcceptedTerms") == nil) {
            termsError.isHidden = false
                return
        }

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
    
    func showAlert() {
        let savedDefaults = UserDefaults.standard
    
        let alert = UIAlertController(title: "Terms and Conditions", message: termsAndConditions, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Accept", style: .cancel, handler:{ action in
            savedDefaults.set("Accepted", forKey: "AcceptedTerms")
        }))
        alert.addAction(UIAlertAction(title: "Decline", style: .destructive, handler:{ action in
            print("tapped decline")
        }))
        
        present(alert,animated: true)
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
    
    override func viewDidAppear(_ animated: Bool) {
        let savedDefaults = UserDefaults.standard
        if (savedDefaults.value(forKey: "AcceptedTerms") == nil) {
            showAlert()
        }
    }
    
    
}

