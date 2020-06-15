//
//  WebViewController.swift
//  QiitaAPIApp2
//
//  Created by Kazuya Fukui on 2020/06/15.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(webView)
        
        guard let urlString = UserDefaults.standard.object(forKey: "url") else { return }
        let url = URL(string: urlString as! String)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
