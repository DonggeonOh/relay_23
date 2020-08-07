//
//  Post.swift
//  BoostcampRelay23
//
//  Created by 임수현 on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import Foundation

class Post {
    private let id: Int
    private let title: String
    private let content: String
    private let author: String
    private let date: String
    
    // ** 일단 String형태로 date가 들어온다고 가정하고 만들었습니다.
    // ** Date 객체로 들어올 경우 주석을 해제하고 사용하면 됩니다.
//    private let date: Date
    
    init(id: Int = 0, title: String = "title", content: String = "content", author: String = "author", date: String = "date") {
        self.id = id
        self.title = title
        self.content = content
        self.author = author
        self.date = date
    }
    //** Date일 경우
//    init(id: Int = 0, title: String = "title", content: String = "content", author: String = "author", date: Date = Date()) {
//        self.id = id
//        self.title = title
//        self.content = content
//        self.author = author
//        self.date = date
//    }
    
}
