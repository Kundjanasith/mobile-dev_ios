//
//  ViewController.swift
//  GoogleSignIn
//
//  Created by Kundjanasith Thonglek on 3/9/17.
//  Copyright © 2017 Kundjanasith. All rights reserved.
//

import UIKit
import Google

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var error: NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        let signInButton = GIDSignInButton(frame: CGRectMake(0, 0, 100, 50))
        signInButton.center = view.center
        view.addSubview(signInButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

