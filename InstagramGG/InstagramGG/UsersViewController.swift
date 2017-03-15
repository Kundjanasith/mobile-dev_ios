//
//  UsersViewController.swift
//  InstagramGG
//
//  Created by Kundjanasith Thonglek on 3/15/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit
import Firebase
class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var user = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logOutPressed(_ sender: Any) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count ?? 0
    }
    
    func retrieveUsers(){
        let ref = FIRDatabase.database().reference()
        ref.child("users").queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
            let users = snapshot.value as! [String: AnyObject]
            self.user.removeAll()
            for (_, value) in users {
                if let uid = value["uid"] as? String {
                    if uid != FIRAuth.auth()!.currentUser!.uid {
                        let userToShow = User()
                        if let fullname = value["Full name"] as? String, let imagePath = value["urlToImage"] as? String {
                            userToShow.fullName = fullname
                            userToShow.imagePath = imagePath
                            userToShow.userID = uid
                            self.user.append(userToShow)
                        }
                    }
                }
            }
        })
    }
}
