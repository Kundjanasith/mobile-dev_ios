//
//  ViewController.swift
//  DemoDatabase
//
//  Created by Kundjanasith Thonglek on 3/9/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref:FIRDatabaseReference?
    var dbHandle:FIRDatabaseHandle?
    var titleData = [String]()
    var descData = [String]()
    
//    var postData = ["Item 1","Item 2","Item 3"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ref = FIRDatabase.database().reference()
        
        ref?.child("Posts").observe(.childAdded, with: {(snapshot) in
            if let snapDict = snapshot.value as? [String:AnyObject]{
                // try using command print(snapDict)  to view the data inside
                print(snapDict)
                for each in snapDict{
                    if (each.key == "title"){
                        self.titleData.append(each.value as! String)
                        print(self.titleData)
                    }
                    if (each.key == "desc"){
                        self.descData.append(each.value as! String)
                        print(self.descData)
                    }
                }
                print(self.descData.count)
                
                // when finish loading data, reload table
                self.tableView.reloadData()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = titleData[indexPath.row]
//        cell?.detailTextLabel?.text = descData[indexPath.row]
        return cell!
    }

}

