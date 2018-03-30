//
//  WebViewController.swift
//  JSONandSlider
//
//  Created by Pranoti Kulkarni on 3/30/18.
//  Copyright © 2018 Pranoti Kulkarni. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var strURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: strURL)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
}
