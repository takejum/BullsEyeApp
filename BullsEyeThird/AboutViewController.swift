//
//  AboutViewController.swift
//  BullsEyeSecond
//
//  Created by Jumpei Takeshita on 2020/07/09.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webview:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webview.load(request)
        }


    }

    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)
    }
}
