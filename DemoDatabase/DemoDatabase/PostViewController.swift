//
//  PostViewController.swift
//  DemoDatabase
//
//  Created by Kundjanasith Thonglek on 3/9/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostViewController: UIViewController {
    
    var ref:FIRDatabaseReference?
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descText: UITextField!
    
    @IBAction func addPost(_ sender: Any) { 
        if let newPost = ref?.child("Posts").childByAutoId(){
            let id = newPost.key
            ref?.child("Posts").child(id).child("title").setValue(titleText.text!)
            ref?.child("Posts").child(id).child("desc").setValue(descText.text!)
        }
        else{
            print("Error")
        }
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
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
