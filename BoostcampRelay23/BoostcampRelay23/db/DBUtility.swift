//
//  DBUtility.swift
//  BoostcampRelay23
//
//  Created by 오태양 on 2020/08/08.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import Foundation
import RealmSwift

func createClass(title:String, content:String, author: String, date: String) -> PostData
{
    let post = PostData()
    post.id = getId()
    post.content = content
    post.author = author
    post.title = title
    post.date = date
    return post
}

//Id 생성 최신글의 Id에 +1. 중간 글 삭제시 재정렬 없음.
func getId() -> Int{
    let realm = try! Realm()
    var Id = 0
    let lastId = realm.objects(PostData.self)
    
    if lastId.count != 0 {
        Id = lastId[lastId.count - 1].id + 1
    }
    
    return Id
}

//날짜 생성.
func getDate() -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.string(from: Date())
    return date
}


