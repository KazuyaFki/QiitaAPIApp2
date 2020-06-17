//
//  ViewController.swift
//  QiitaAPIApp2
//
//  Created by Kazuya Fukui on 2020/06/14.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage




class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var qiitaArry = [Qiita]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return qiitaArry.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let titleLabel = cell.viewWithTag(1) as! UILabel
        titleLabel.text = qiitaArry[indexPath.row].title
        
        let nameLabel = cell.viewWithTag(2) as! UILabel
        nameLabel.text = qiitaArry[indexPath.row].name
        
        let imageView = cell.viewWithTag(3) as! UIImageView
        let imageURL = URL(string: qiitaArry[indexPath.row].profileImageString)
        imageView.sd_setImage(with: imageURL, completed: nil)
        imageView.layer.cornerRadius = 38
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let webViewController = WebViewController()
        let url = qiitaArry[indexPath.row].urlString
        
        UserDefaults.standard.set(url, forKey: "url")
        
        present(webViewController, animated: true, completion: nil)
        
        
    }
    
    
    private func getData() {
        
        let url = "https://qiita.com/api/v2/items?page=1&per_page=20"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success:
                
                for i in 0...19 {
                    let json:JSON = JSON(response.data as Any)
                    guard let title = json[i]["title"].string else { return }
                    guard let name = json[i]["user"]["name"].string else { return }
                    guard let profileImage = json[i]["user"]["profile_image_url"].string else { return }
                    guard let url = json[i]["url"].string else { return }
                    
                    self.qiitaArry.append(Qiita(title: title, name: name, profileImageString: profileImage, urlString: url))
                    
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
                
            }
        }
        
        
    }
    
    
    
}

