//
//  ViewController.swift
//  Login
//
//  Created by Kundjanasith Thonglek on 2/23/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    @IBOutlet weak var passTF: UITextField!
    
    
    @IBOutlet weak var signInBtn: UIButton!
    
    var isSignIn:Bool = true;
    @IBAction func signInChanged(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn;
        if isSignIn {
            signInLabel.text = "Sign In";
            signInBtn.setTitle("Sign In", for: .normal)
        } else {
            signInLabel.text = "Register";
            signInBtn.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        if let email = emailTF.text, let pass = passTF.text {
            if isSignIn {
                //Log in
                FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "ToWelcome", sender: self)
                    } else {
                        let alert = UIAlertController(title: "Alert", message: "Not Found", preferredStyle: UIAlertControllerStyle.alert)
                        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true, completion: nil)
                    
                    }
                })
            } else {
                //Register
                FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user{
                        //Go to Welcome scene
                        self.performSegue(withIdentifier: "ToWelcome", sender: self)
                    } else {
                        //Show Error
                        print(error!)
                    }
                })
            
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTF.resignFirstResponder()
        passTF.resignFirstResponder()
    }


}

