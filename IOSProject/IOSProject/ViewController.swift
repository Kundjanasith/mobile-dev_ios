//
//  ViewController.swift
//  IOSProject
//
//  Created by Kundjanasith Thonglek on 3/11/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController, UITextFieldDelegate {
    var ref:FIRDatabaseReference?
    var dbHandle:FIRDatabaseHandle?
    var titleUser = [String]()
    var titlePass = [String]()

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
        print("Click Login")
        if login_user(userStr: usernameTxt.text!,passStr: passwordTxt.text!) {
            
        }
    }
    
    func login_user(userStr: String, passStr:String) -> Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        ref?.child("Users").observe(.childAdded, with: {(snapshot) in
            if let snapDict = snapshot.value as? [String:AnyObject]{
                for each in snapDict{
                    if (each.key == "Username"){
                        self.titleUser.append(each.value as! String)
                    }
                    if (each.key == "Password"){
                        self.titleUser.append(each.value as! String)
                    }
                }
            }
            
        })
        print(titleUser)
        print(titlePass)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if (textField == TextField ){
        scrollView.setContentOffset(CGPoint(x:0,y:200), animated: true)
//        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x:0,y:-60), animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
 

}

