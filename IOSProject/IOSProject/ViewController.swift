//
//  ViewController.swift
//  IOSProject
//
//  Created by Kundjanasith Thonglek on 3/11/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController, UITextFieldDelegate{
    var ref:FIRDatabaseReference?
    var dbHandle:FIRDatabaseHandle?
    var titleUser = [String]()
    var titlePass = [String]()
    @IBOutlet var testLa1: UILabel!
    var titleFirst = [String]()
    var titleLast = [String]()
    var titleEmail = [String]()
    var titlePhone = [String]()
    var FN = "Error"
    var LN = "Error"
    var EM = "Error"
    var PH = "Error"
    
//    @IBOutlet var aview: UIView!
    @IBOutlet var testLa: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    
    @IBOutlet var RegisBtn: UIButton!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var LogInBtn: UIButton!
    
    @IBAction func loginBtn(_ sender: Any) {
        print("Click Login")
        if login_user(userStr: usernameTxt.text!,passStr: passwordTxt.text!) {
            self.navigationController?.isNavigationBarHidden = true
            usernameTxt.layer.cornerRadius = 8.0
            usernameTxt.layer.masksToBounds = true
            usernameTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            usernameTxt.layer.borderWidth = 2.0
            passwordTxt.layer.cornerRadius = 8.0
            passwordTxt.layer.masksToBounds = true
            passwordTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            passwordTxt.layer.borderWidth = 2.0
            self.RegisBtn.removeFromSuperview()
            self.LogInBtn.removeFromSuperview()
            self.usernameTxt.removeFromSuperview()
            self.passwordTxt.removeFromSuperview()
            self.usernameLabel.removeFromSuperview()
            self.passwordLabel.removeFromSuperview()
            self.scrollView.addSubview(testLa)
            self.scrollView.addSubview(testLa1)
            
            
            let xCenterConstraint = NSLayoutConstraint(item: testLa, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0)
//            let yCenterConstraint = NSLayoutConstraint(item: testLa, attribute: .centerY, relatedBy: .equal, toItem: scrollView, attribute: .centerY, multiplier: 1, constant: 0)
            let yCenterConstraint = NSLayoutConstraint(item: testLa, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 10)
            let leadingConstraint1 = NSLayoutConstraint(item: testLa, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 10)
            let trailingConstraint1 = NSLayoutConstraint(item: testLa, attribute: .trailing, relatedBy: .equal, toItem: scrollView, attribute: .trailing, multiplier: 1, constant: -10)
            self.scrollView.addConstraints([xCenterConstraint, yCenterConstraint, leadingConstraint1])
            
            let xCenterConstraint1 = NSLayoutConstraint(item: testLa1, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0)
            let yCenterConstraint2 = NSLayoutConstraint(item: testLa1, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1, constant: 10)
            let leadingConstraint11 = NSLayoutConstraint(item: testLa1, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 10)
            self.scrollView.addConstraints([xCenterConstraint1, yCenterConstraint2, leadingConstraint11 ])
            
            

            let s1 = "\n\nPersonal Information \n"
            let s2 = "\nFirstname : "+FN+"\n"
            let s3 = "\nLastname : "+LN+"\n"
            let s4 = "\nEmail : "+EM+"\n"
            let s5 = "\nPhone number : "+PH+"\n"
            print(s1+s2)
            testLa.text = s1 + s2 + s3 + s4 + s5
            testLa1.text = "Welcome"
            testLa1.textAlignment = .natural
//            self.scrollView.removeFromSuperview()
//            let newViewController = WelcomeViewController()
//            self.navigationController?.pushViewController(newViewController, animated: true)
//            self.present(newViewController, animated: true, completion: nil)
        }
        else{
            usernameTxt.layer.cornerRadius = 8.0
            usernameTxt.layer.masksToBounds = true
            usernameTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            usernameTxt.layer.borderWidth = 2.0
            passwordTxt.layer.cornerRadius = 8.0
            passwordTxt.layer.masksToBounds = true
            passwordTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            passwordTxt.layer.borderWidth = 2.0
        }
    }
    
    func login_user(userStr: String, passStr:String) -> Bool{
        print("Login User")
        var ind:Int = -1
        print(titleUser)
        print(titlePass)
        for i in 0...(titleUser.count-1){
            print(i)
            if titleUser[i] == userStr {
                ind = i
                break
            }
        }
        if ind == -1 { return false }
        print("XXX"+titlePass[ind])
        FN = titleFirst[ind]
        LN = titleLast[ind]
        EM = titleEmail[ind]
        PH = titlePhone[ind]
        if passStr == titlePass[ind] { return true }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testLa.removeFromSuperview()
        self.testLa1.removeFromSuperview()
        ref = FIRDatabase.database().reference()
        ref?.child("Users").observe(.childAdded, with: {(snapshot) in
            if let snapDict = snapshot.value as? [String:AnyObject]{
                for each in snapDict{
                    if (each.key == "Username"){
                        self.titleUser.append(each.value as! String)
                    }
                    if (each.key == "Password"){
                        self.titlePass.append(each.value as! String)
                    }
                    if (each.key == "Firstname"){
                        self.titleFirst.append(each.value as! String)
                    }
                    if (each.key == "Lastname"){
                        self.titleLast.append(each.value as! String)
                    }
                    if (each.key == "Email"){
                        self.titleEmail.append(each.value as! String)
                    }
                    if (each.key == "Phone"){
                        self.titlePhone.append(each.value as! String)
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

