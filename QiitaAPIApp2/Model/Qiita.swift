//
//  Qiita.swift
//  QiitaAPIApp2
//
//  Created by Kazuya Fukui on 2020/06/15.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import Foundation

struct Qiita {
    
    var title:String
    var name:String
    var profileImageString:String
    var urlString:String
    
    init(title: String, name: String, profileImageString: String, urlString: String) {
        self.title = title
        self.name = name
        self.profileImageString = profileImageString
        self.urlString = urlString
    }
    
}
