//
//  DBrealm.swift
//  BoostcampRelay23
//
//  Created by 오태양 on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//
//Create, Read, Delete기능 구현. Update기능 없음.
//


import Foundation
import RealmSwift

//PostData 객체 형성. 데이터베이스에서 테이블의 개념이라고 보면 됨.
class PostData: Object{
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var date : String = ""
    
}


//내부 DB파일 주소 출력
func getDBFileURL(){
    let _ = try! Realm()
    
    if let fileURL = Realm.Configuration.defaultConfiguration.fileURL{
        print(fileURL)
    }
}



//Create
func createPost(title:String, content:String, author: String)
{
    do{
        let realm = try! Realm()
        let date = getDate()
        let post = createClass(title: title, content: content, author: author, date: date)
        
        try realm.write{ // realm.write{}는 git에서 commit을 해주는 것과 비슷하다.
            realm.add(post) // 데이터베이스에 park 모델을 더한다.
        }
    } catch {
        print("Error Add \(error)")
    }
}

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




//Read
func readPost(id: Int) -> Results<PostData>{
    let realm = try! Realm()
    let post = realm.objects(PostData.self).filter("id == \(id)")

    print(post)
    return post
}


//Read List. 글목록 전부 반환. 배열처럼 인덱스로 접근 가능. 배열은 아니라고 합니다.
func readPostList() -> Results<PostData> {
    let realm = try! Realm()
    let readAll = realm.objects(PostData.self)
    
    print(readAll)
    return readAll
}


//Delete
func Delete(id: Int){
    let realm = try! Realm()
    let user = realm.objects(PostData.self).filter("id == \(id)")
    try! realm.write { realm.delete(user) }
}




