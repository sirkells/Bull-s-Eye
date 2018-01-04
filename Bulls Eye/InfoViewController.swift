//
//  InfoViewController.swift
//  Bulls Eye
//
//  Created by Kelechi Igbokwe on 18.12.17.
//  Copyright © 2017 Kelechi Igbokwe. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
