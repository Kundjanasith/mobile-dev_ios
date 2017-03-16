//
//  WebViewController.swift
//  DRice_Prototype
//
//  Created by Kundjanasith Thonglek on 3/16/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webV: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        webV.delegate = self
//        if let url = URL(string: "http://www.bbc.com/news/topics/b6313976-a311-480f-a813-08caddad7a2f/agriculture") {
//            let request = URLRequest(url: url)
//            webV.loadRequest(request)
//        }
        if let address = URL(string: "http://www.bbc.com/news/topics/b6313976-a311-480f-a813-08caddad7a2f/agriculture"){
            let request = URLRequest(url: address)
            webV.loadRequest(request)
        }
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
