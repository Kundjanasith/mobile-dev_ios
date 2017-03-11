//
//  RegisViewController.swift
//  IOSProject
//
//  Created by Kundjanasith Thonglek on 3/11/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit

class RegisViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var cpasswordTxt: UITextField!
    
    @IBOutlet weak var firstnameTxt: UITextField!
    @IBOutlet weak var lastnameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    
    @IBAction func confirmRegis(_ sender: Any) {
            print("Press confirm")
            print("Username : "+usernameTxt.text!)
        if isValidUser(userStr: usernameTxt.text!) {
            usernameTxt.layer.cornerRadius = 8.0
            usernameTxt.layer.masksToBounds = true
            usernameTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            usernameTxt.layer.borderWidth = 2.0
        }
        else {
            usernameTxt.layer.cornerRadius = 8.0
            usernameTxt.layer.masksToBounds = true
            usernameTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            usernameTxt.layer.borderWidth = 2.0
        }
            print("Password : "+passwordTxt.text!)
            print("Confirm Password : "+cpasswordTxt.text!)
        if isValidPass(passStr: passwordTxt.text!, cpassStr: cpasswordTxt.text!) {
            passwordTxt.layer.cornerRadius = 8.0
            passwordTxt.layer.masksToBounds = true
            passwordTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            passwordTxt.layer.borderWidth = 2.0
            cpasswordTxt.layer.cornerRadius = 8.0
            cpasswordTxt.layer.masksToBounds = true
            cpasswordTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            cpasswordTxt.layer.borderWidth = 2.0
        }
        else{
            passwordTxt.layer.cornerRadius = 8.0
            passwordTxt.layer.masksToBounds = true
            passwordTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            passwordTxt.layer.borderWidth = 2.0
            cpasswordTxt.layer.cornerRadius = 8.0
            cpasswordTxt.layer.masksToBounds = true
            cpasswordTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            cpasswordTxt.layer.borderWidth = 2.0
        }
            print("Firstname : "+firstnameTxt.text!)
        if isValidName(testStr: firstnameTxt.text!) {
            firstnameTxt.layer.cornerRadius = 8.0
            firstnameTxt.layer.masksToBounds = true
            firstnameTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            firstnameTxt.layer.borderWidth = 2.0
        }
        else{
            firstnameTxt.layer.cornerRadius = 8.0
            firstnameTxt.layer.masksToBounds = true
            firstnameTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            firstnameTxt.layer.borderWidth = 2.0
            
        }
            print("Lastname : "+lastnameTxt.text!)
        if isValidName(testStr: lastnameTxt.text!) {
            lastnameTxt.layer.cornerRadius = 8.0
            lastnameTxt.layer.masksToBounds = true
            lastnameTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            lastnameTxt.layer.borderWidth = 2.0
        }
        else{
            lastnameTxt.layer.cornerRadius = 8.0
            lastnameTxt.layer.masksToBounds = true
            lastnameTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            lastnameTxt.layer.borderWidth = 2.0
            
        }
            print("Email : "+emailTxt.text!)
            print(isValidEmail(testStr: emailTxt.text!))
        if isValidEmail(testStr: emailTxt.text!){
            emailTxt.layer.cornerRadius = 8.0
            emailTxt.layer.masksToBounds = true
            emailTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            emailTxt.layer.borderWidth = 2.0
        }
        else{
            emailTxt.layer.cornerRadius = 8.0
            emailTxt.layer.masksToBounds = true
            emailTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            emailTxt.layer.borderWidth = 2.0
        }
            print("Phone number : "+phoneTxt.text!)
            print(isValidPhone(testStr: phoneTxt.text!))
        if isValidPhone(testStr: phoneTxt.text!){
            phoneTxt.layer.cornerRadius = 8.0
            phoneTxt.layer.masksToBounds = true
            phoneTxt.layer.borderColor = UIColor( red: 0/255, green: 255/255, blue:0/255, alpha: 1.0 ).cgColor
            phoneTxt.layer.borderWidth = 2.0
        }
        else{
            phoneTxt.layer.cornerRadius = 8.0
            phoneTxt.layer.masksToBounds = true
            phoneTxt.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            phoneTxt.layer.borderWidth = 2.0
        }
       
        if isValidUser(userStr: usernameTxt.text!) &&
        isValidPass(passStr: passwordTxt.text!, cpassStr: cpasswordTxt.text!) &&
        isValidName(testStr: firstnameTxt.text!) && isValidName(testStr: lastnameTxt.text!) &&
            isValidEmail(testStr: emailTxt.text!) && isValidPhone(testStr: phoneTxt.text!){
            print("OKK")
            
            regis_true(userStr: usernameTxt.text!)
        }
        else{
            print("Input error")
        }
    }
    
    func isValidUser(userStr: String) -> Bool {
        if userStr.characters.count == 0 { return false }
        return true
    }
    
    func isValidPass(passStr: String, cpassStr: String) -> Bool {
        if passStr.characters.count == 0 { return false }
        if cpassStr.characters.count == 0 { return false }
        if cpassStr != passStr { return false }
        return true
    }
    
    func isValidName(testStr:String) -> Bool {
        let nameStr = testStr
        if nameStr.characters.count == 0 { return false }
        if nameStr.contains("0") { return false }
        if nameStr.contains("1") { return false }
        if nameStr.contains("2") { return false }
        if nameStr.contains("3") { return false }
        if nameStr.contains("4") { return false }
        if nameStr.contains("5") { return false }
        if nameStr.contains("6") { return false }
        if nameStr.contains("7") { return false }
        if nameStr.contains("8") { return false }
        if nameStr.contains("9") { return false }
        return true
    }
    
    func isValidPhone(testStr:String) -> Bool {
        let phoneStr = testStr
        print(phoneStr.characters.count)
        if phoneStr.characters.count != 10 {
            return false
        }
        else{
            let a0 = String(phoneStr.characters.prefix(0))
            print(a0)
            let a1 = String(phoneStr.characters.prefix(1))
            print(a1)
            if a1 != "0" { return false }
            let a2 = String(String(phoneStr.characters.prefix(2)).characters.suffix(1))
            print(a2)
            if !"0123456789".contains(a2) { return false }
            let a3 = String(String(phoneStr.characters.prefix(3)).characters.suffix(1))
            if !"0123456789".contains(a3) { return false }
            print(a3)
            let a4 = String(String(phoneStr.characters.prefix(4)).characters.suffix(1))
            if !"0123456789".contains(a4) { return false }
            print(a4)
            let a5 = String(String(phoneStr.characters.prefix(5)).characters.suffix(1))
            if !"0123456789".contains(a5) { return false }
            print(a5)
            let a6 = String(String(phoneStr.characters.prefix(6)).characters.suffix(1))
            if !"0123456789".contains(a6) { return false }
            print(a6)
            let a7 = String(String(phoneStr.characters.prefix(7)).characters.suffix(1))
            if !"0123456789".contains(a7) { return false }
            print(a7)
            let a8 = String(String(phoneStr.characters.prefix(8)).characters.suffix(1))
            if !"0123456789".contains(a8) { return false }
            print(a8)
            let a9 = String(String(phoneStr.characters.prefix(9)).characters.suffix(1))
            if !"0123456789".contains(a9) { return false }
            print(a9)
            let a10 = String(String(phoneStr.characters.prefix(10)).characters.suffix(1))
            if !"0123456789".contains(a10) { return false }
            print(a10)
        }
        return true
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func regis_true(userStr: String) {
        let alertController = UIAlertController(title: "Welcome . . .", message: "Hi, "+userStr, preferredStyle: UIAlertControllerStyle.alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
            _ = self.navigationController?.popToRootViewController(animated: true)
        }
        
//                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
//                    UIAlertAction in
//                    NSLog("Cancel Pressed")
//                }
        
        // Add the actions
        alertController.addAction(okAction)
        //        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
