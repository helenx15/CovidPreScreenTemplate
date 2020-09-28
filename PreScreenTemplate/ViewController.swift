//
//  ViewController.swift
//  PreScreenTemplate
//
//  Created by Helen Xiao on 6/17/20.
//  Copyright © 2020 Helen Xiao. All rights reserved.
//
//  LIST OF ALL SAVED DEFAULTS
//  TODO: Change depending on # of questions
//    Key: "UserClear"
//    Key: "UserNotClear"
//    Key: "Q1Yes"
//    Key: "Q2Yes"
//    Key: "Q3Yes"
//    Key: "Q4Yes"
//    Key: "Q5Yes"
//    Key: "Q6Yes"
//    Key: "Q7Yes"
//    Key: "Q8Yes"
//    Key: "Q9Yes"
//    Key: "Q10Yes"
//    Key: "Q11Yes"
//    Key: "Temperature"
//    Key: "DateSubmitted"
//    Key: "TimeSubmitted"

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //TODO: Replace INSERT SCHOOL NAME HERE with School Name
    let termsAndConditions = "MOBILE APPLICATION END USER LICENSE AGREEMENT \n This Mobile Application End User License Agreement (“Agreement”) is a binding agreement between you (“End User” or “you”) and Blue Devil Apps LLC (“Company”). This Agreement governs your use of the [INSERT SCHOOL NAME HERE] (the “School”) Covid 19 Information Application (including all related documentation, the “Application”). The Application is licensed, not sold, to you.\n BY CLICKING THE “ACCEPT” BUTTON, YOU: (A) ACKNOWLEDGE THAT YOU HAVE READ AND UNDERSTAND THIS AGREEMENT; (B) REPRESENT THAT YOU ARE OF LEGAL AGE TO ENTER INTO A BINDING AGREEMENT; AND (C) ACCEPT THIS AGREEMENT AND AGREE THAT YOU ARE LEGALLY BOUND BY ITS TERMS. IF YOU DO NOT AGREE TO THESE TERMS, DO NOT DOWNLOAD OR USE THE APPLICATION AND DELETE IT FROM YOUR MOBILE DEVICE IF YOU HAVE DOWNLOADED IT.\n THIS APPLICATION IS NOT DESIGNED OR INTENDED FOR USE IN THE DIAGNOSIS OR TREATMENT OF DISEASE OR OTHER CONDITIONS, AND THE RECOMMENDATIONS PROVIDED BY THE APPLICATION DO NOT CONSTITUTE MEDICAL ADVICE. PLEASE CONSULT YOUR HEALTHCARE PROVIDER PRIOR TO MAKING ANY DECISIONS RELATED TO YOUR HEALTH.\n IN THE EVENT OF A MEDICAL EMERGENCY, PLEASE CALL EMERGENCY SERVICES.\n 1.    License Grant. Subject to the terms of this Agreement, Company grants you a limited, non-exclusive, and nontransferable license to download, install, and use the Application for your personal, non-commercial use on a single mobile device owned or otherwise controlled by you (“Mobile Device”) strictly in accordance with the Application’s documentation.\n 2.    License Restrictions. You shall not:\n (a)    copy the Application, except as expressly permitted by this license;\n (b)    modify, translate, adapt, or otherwise create derivative works or improvements, whether or not patentable, of the Application;\n (c)    reverse engineer, disassemble, decompile, decode, or otherwise attempt to derive or gain access to the source code of the Application or any part thereof;\n (d)    remove, delete, alter, or obscure any trademarks or any copyright, trademark, patent, or other intellectual property or proprietary rights notices from the Application, including any copy thereof;\n (e)    rent, lease, lend, sell, sublicense, assign, distribute, publish, transfer, or otherwise make available the Application, or any features or functionality of the Application, to any third party for any reason, including by making the Application available on a network where it is capable of being accessed by more than one device at any time; or\n (f)    remove, disable, circumvent, or otherwise create or implement any workaround to any copy protection, rights management, or security features in or protecting the Application.\n 3.    Reservation of Rights. You acknowledge and agree that the Application is provided under license, and not sold, to you. You do not acquire any ownership interest in the Application under this Agreement, or any other rights thereto other than to use the Application in accordance with the license granted, and subject to all terms, conditions, and restrictions, under this Agreement. Company and its licensors and service providers reserve and shall retain their entire right, title, and interest in and to the Application, including all copyrights, trademarks, and other intellectual property rights therein or relating thereto, except as expressly granted to you in this Agreement.\n 4.    Collection and Use of Your Information. You acknowledge that when you download, install, or use the Application, Company may use automatic means (including, for example, cookies and web beacons) to collect information about your Mobile Device and about your use of the Application. You also may be required to provide certain information about yourself as a condition to downloading, installing, or using the Application or certain of its features or functionality. All information we collect through or in connection with this Application is controlled by the School and not us. By downloading, installing, using, and providing information to or through this Application, you consent to all actions taken by us with respect to your information in compliance with any agreement between us and the School.\n 5.    Geographic Restrictions. The Content and Services are based in the state of California in the United States and provided for access and use only by persons located in the United States. You acknowledge that you may not be able to access all or some of the Content and Services outside of the United States and that access thereto may not be legal by certain persons or in certain countries. If you access the Content and Services from outside the United States, you are responsible for compliance with local laws.\n 6.    Updates. Company may from time to time in its sole discretion develop and provide Application updates, which may include upgrades, bug fixes, patches, other error corrections, and/or new features (collectively, including related documentation, “Updates”). Updates may also modify or delete in their entirety certain features and functionality. You agree that Company has no obligation to provide any Updates or to continue to provide or enable any particular features or functionality. Based on your Mobile Device settings, when your Mobile Device is connected to the internet either:\n (a)    the Application will automatically download and install all available Updates; or\n (b)    you may receive notice of or be prompted to download and install available Updates.\n You shall promptly download and install all Updates and acknowledge and agree that the Application or portions thereof may not properly operate should you fail to do so. You further agree that all Updates will be deemed part of the Application and be subject to all terms and conditions of this Agreement.\n 7.    Third-Party Materials. The Application may display, include, or make available third-party content (including data, information, applications, and other products, services, and/or materials) or provide links to third-party websites or services, including through third-party advertising (“Third-Party Materials”). You acknowledge and agree that Company is not responsible for Third-Party Materials, including their accuracy, completeness, timeliness, validity, copyright compliance, legality, decency, quality, or any other aspect thereof. Company does not assume and will not have any liability or responsibility to you or any other person or entity for any Third-Party Materials. Third-Party Materials and links thereto are provided solely as a convenience to you, and you access and use them entirely at your own risk and subject to such third parties’ terms and conditions.\n 8.    Term and Termination.\n (a)    The term of Agreement commences when you download the Application or acknowledge acceptance, whichever is earlier, and will continue in effect until terminated by you or Company as set forth in this Section 9.\n (b)    You may terminate this Agreement by deleting the Application and all copies thereof from your Mobile Device.\n (c)    Company may terminate this Agreement at any time without notice if: (i) it ceases to support the Application (which Company may do in its sole discretion); or (ii) the agreement between the School and the Company expires or is terminated. In addition, this Agreement will terminate immediately and automatically without any notice if you violate any of the terms and conditions of this Agreement.\n (d)    Upon termination:\n (i)    all rights granted to you under this Agreement will also terminate; and\n (ii)    you must cease all use of the Application and delete all copies of the Application from your Mobile Device and account.\n (e)    Termination will not limit any of Company’s rights or remedies at law or in equity.\n 9.    Disclaimer of Warranties.\n (a)    THE APPLICATION IS PROVIDED TO END USER “AS IS” AND WITH ALL FAULTS AND DEFECTS WITHOUT WARRANTY OF ANY KIND. TO THE MAXIMUM EXTENT PERMITTED UNDER APPLICABLE LAW, COMPANY, ON ITS OWN BEHALF AND ON BEHALF OF ITS AFFILIATES AND ITS AND THEIR RESPECTIVE LICENSORS AND SERVICE PROVIDERS, EXPRESSLY DISCLAIMS ALL WARRANTIES, WHETHER EXPRESS, IMPLIED, STATUTORY, OR OTHERWISE, WITH RESPECT TO THE APPLICATION, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND NON-INFRINGEMENT, AND WARRANTIES THAT MAY ARISE OUT OF COURSE OF DEALING, COURSE OF PERFORMANCE, USAGE, OR TRADE PRACTICE. WITHOUT LIMITATION TO THE FOREGOING, COMPANY PROVIDES NO WARRANTY OR UNDERTAKING, AND MAKES NO REPRESENTATION OF ANY KIND THAT THE APPLICATION WILL MEET YOUR REQUIREMENTS, ACHIEVE ANY INTENDED RESULTS, BE COMPATIBLE, OR WORK WITH ANY OTHER SOFTWARE, APPLICATIONS, SYSTEMS, OR SERVICES, OPERATE WITHOUT INTERRUPTION, MEET ANY PERFORMANCE OR RELIABILITY STANDARDS, OR BE ERROR-FREE, OR THAT ANY ERRORS OR DEFECTS CAN OR WILL BE CORRECTED.\n (b)    SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF OR LIMITATIONS ON IMPLIED WARRANTIES OR THE LIMITATIONS ON THE APPLICABLE STATUTORY RIGHTS OF A CONSUMER, SO SOME OR ALL OF THE ABOVE EXCLUSIONS AND LIMITATIONS MAY NOT APPLY TO YOU.\n 10.    Limitation of Liability. TO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT WILL COMPANY OR ITS AFFILIATES, OR ANY OF ITS OR THEIR RESPECTIVE LICENSORS OR SERVICE PROVIDERS, HAVE ANY LIABILITY ARISING FROM OR RELATED TO YOUR USE OF OR INABILITY TO USE THE APPLICATION OR THE CONTENT AND SERVICES FOR:\n (a)    PERSONAL INJURY, PROPERTY DAMAGE, LOST PROFITS, COST OF SUBSTITUTE GOODS OR SERVICES, LOSS OF DATA, LOSS OF GOODWILL, BUSINESS INTERRUPTION, COMPUTER FAILURE OR MALFUNCTION, OR ANY OTHER CONSEQUENTIAL, INCIDENTAL, INDIRECT, EXEMPLARY, SPECIAL, OR PUNITIVE DAMAGES.\n (b)    DIRECT DAMAGES IN EXCESS OF FIFTY DOLLARS ($50.00).\n THE FOREGOING LIMITATIONS WILL APPLY WHETHER SUCH DAMAGES ARISE OUT OF BREACH OF CONTRACT, TORT (INCLUDING NEGLIGENCE), OR OTHERWISE AND REGARDLESS OF WHETHER SUCH DAMAGES WERE FORESEEABLE OR COMPANY WAS ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. SOME JURISDICTIONS DO NOT ALLOW CERTAIN LIMITATIONS OF LIABILITY SO SOME OR ALL OF THE ABOVE LIMITATIONS OF LIABILITY MAY NOT APPLY TO YOU.\n 11.    Export Regulation. The Application may be subject to US export control laws, including the Export Control Reform Act and its associated regulations. You shall not, directly or indirectly, export, re-export, or release the Application to, or make the Application accessible from, any jurisdiction or country to which export, re-export, or release is prohibited by law, rule, or regulation. You shall comply with all applicable federal laws, regulations, and rules, and complete all required undertakings (including obtaining any necessary export license or other governmental approval), prior to exporting, re-exporting, releasing, or otherwise making the Application available outside the US.\n 12.    US Government Rights. The Application is commercial computer software, as such term is defined in 48 C.F.R. §2.101. Accordingly, if you are an agency of the US Government or any contractor therefor, you receive only those rights with respect to the Application as are granted to all other end users under license, in accordance with (a) 48 C.F.R. §227.7201 through 48 C.F.R. §227.7204, with respect to the Department of Defense and their contractors, or (b) 48 C.F.R. §12.212, with respect to all other US Government licensees and their contractors.\n 13.    Severability. If any provision of this Agreement is illegal or unenforceable under applicable law, the remainder of the provision will be amended to achieve as closely as possible the effect of the original term and all other provisions of this Agreement will continue in full force and effect.\n 14.    Governing Law. This Agreement is governed by and construed in accordance with the internal laws of the State of California without giving effect to any choice or conflict of law provision or rule.\n 15.    Disputes; Arbitration.\n (a)    The term “Dispute” means any dispute, claim, or controversy between you and Company or any of its current or former affiliates, including parents and subsidiaries, and any predecessor or successor entity to any of the foregoing (“Company Entity”) regarding the use of the Application, whether based in contract, statute, regulation, ordinance, tort (including fraud, misrepresentation, fraudulent inducement, or negligence), or any other legal or equitable theory, and includes the validity, enforceability or scope of this Section 15 (with the exception of the enforceability of the Class Action Waiver clause below). “Dispute” has the broadest possible meaning that will be enforced.\n (b)    If you have a Dispute (other than one described as excluded from arbitration below) with any Company Entity or a Company Entity’s officers, directors, employees and agents (“Adverse Company Entity”) that cannot be resolved through negotiation as required below, you and the Adverse Company Entity must seek resolution of the Dispute only through arbitration of that Dispute according to the terms of this Section, and not litigate that Dispute in court. Arbitration means that the Dispute will be resolved by a neutral arbitrator instead of in a court by a judge or jury.\n (c)    YOU AND THE COMPANY ENTITY AGREE THAT ANY CLAIM FILED BY YOU OR BY A COMPANY ENTITY IN SMALL CLAIMS COURT IS NOT SUBJECT TO THE ARBITRATION TERMS CONTAINED IN THIS SECTION.\n (d)    IF YOU DO NOT WISH TO BE BOUND BY THE BINDING ARBITRATION AND CLASS ACTION WAIVER IN THIS SECTION, YOU MUST NOTIFY THE COMPANY IN WRITING WITHIN 30 DAYS OF THE DATE THAT YOU ACCEPT THIS AGREEMENT. YOUR WRITTEN NOTIFICATION MUST BE MAILED TO THE COMPANY AT 116 SANTIAGO DRIVE, DANVILLE, CA 94526 (WITH A COPY BY EMAIL TO BLUEDEVILAPPS@GMAIL.COM), AND MUST INCLUDE: (1) YOUR NAME, (2) YOUR ADDRESS, (3) YOUR SIGN IN ID IF YOU HAVE ONE, AND (4) A CLEAR STATEMENT THAT YOU DO NOT WISH TO RESOLVE DISPUTES WITH ANY COMPANY ENTITY THROUGH ARBITRATION.\n (e)    IF YOU HAVE A DISPUTE WITH ANY COMPANY ENTITY, YOU MUST SEND WRITTEN NOTICE TO THE COMPANY 116 SANTIAGO DRIVE, DANVILLE, CA 94526 (WITH A COPY BY EMAIL TO BLUEDEVILAPPS@GMAIL.COM), TO GIVE THE ADVERSE COMPANY ENTITY AN OPPORTUNITY TO RESOLVE THE DISPUTE INFORMALLY THROUGH NEGOTIATION.\n (f)    You agree to negotiate resolution of the Dispute in good faith for no fewer than 60 days after you provide notice of the Dispute. If the Adverse Company Entity does not resolve your Dispute within 60 days from its receipt of notice of the Dispute, you or the Adverse Company Entity may pursue your claim in arbitration pursuant to the terms in this Section.\n (g)    ANY DISPUTE RESOLUTION PROCEEDINGS, WHETHER IN ARBITRATION OR COURT, WILL BE CONDUCTED ONLY ON AN INDIVIDUAL BASIS AND NOT IN A CLASS OR REPRESENTATIVE ACTION OR AS A NAMED OR UNNAMED MEMBER IN A CLASS, CONSOLIDATED, REPRESENTATIVE OR PRIVATE ATTORNEY GENERAL ACTION, UNLESS BOTH YOU AND THE ADVERSE COMPANY ENTITY SPECIFICALLY AGREE TO DO SO IN WRITING FOLLOWING INITIATION OF THE ARBITRATION.\n (h)    If you or the Adverse Company Entity elect to resolve your Dispute through arbitration, the party initiating the arbitration proceeding shall initiate it with the American Arbitration Association (“AAA”). This Section’s terms govern if they conflict with AAA’s rules.\n (i)    The Federal Arbitration Act (“FAA”) governs the arbitrability of all disputes involving interstate commerce. However, applicable federal or state law may also apply to the substance of a Dispute. For claims of less than $75,000, the AAA’s Supplementary Procedures for Consumer-Related Disputes (“Supplementary Procedures”) apply including the schedule of arbitration fees set forth in section C-8 of the Supplementary Procedures; for claims over $75,000, the AAA’s Commercial Arbitration Rules and relevant fee schedules for non-class action proceedings apply.\n (j)    The AAA rules are available at www.adr.org or by calling 1-800-778-7879. Further, if your claims do not exceed $75,000 and you provided notice to and negotiated in good faith with the Adverse Company Entity as described above, if the arbitrator finds that you are the prevailing party in the arbitration, you will be entitled to recover reasonable attorneys’ fees and costs as determined by the arbitrator, in addition to any rights to recover the same under controlling state or federal law afforded to the Adverse Company Entity or you.\n (k)    The arbitrator will make any award in writing but need not provide a statement of reasons unless requested by a party. The arbitrator’s award will be binding and final, except for any right of appeal provided by the FAA, and may be entered in any court having jurisdiction over the parties for purposes of enforcement.\n (l)    You or the Adverse Company Entity may initiate arbitration in either Contra Costa County, California or the county in which you reside. If you select the county of your residence, the Adverse Company Entity may transfer the arbitration to Contra Costa County, California if it agrees to pay any additional fees or costs you incur as a result of the change in location as determined by the arbitrator.\n (m)    If any clause within this Section (other than the Class Action Waiver clause above) is illegal or unenforceable, that clause will be severed from this Section, and the remainder of this Section will be given full effect. If the Class Action Waiver clause is found to be illegal or unenforceable, this entire Section will be unenforceable, and the Dispute will be decided by a court.\n 16.    Entire Agreement. This Agreement constitutes the entire agreement between you and Company with respect to the Application and supersede all prior or contemporaneous understandings and agreements, whether written or oral, with respect to the Application.\n 17.    Waiver. No failure to exercise, and no delay in exercising, on the part of either party, any right or any power hereunder shall operate as a waiver thereof, nor shall any single or partial exercise of any right or power hereunder preclude further exercise of that or any other right hereunder. In the event of a conflict between this Agreement and any applicable purchase or other terms, the terms of this Agreement shall govern."
    
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
           
            //TODO: Change depending on # of questions
            // Dates are not the same, clear all previous date's data: Answers to questionnaire, clear/not clear screens, temp entered, date submitted
            savedDefaults.removeObject(forKey: "UserClear")
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

