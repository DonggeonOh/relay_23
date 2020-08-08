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
//일단 출력만 되게 해놓았습니다. 반환시 fileURL의 타입은 URL? 입니다
func getDBFileURL(){
    let _ = try! Realm()
    
    if let fileURL = Realm.Configuration.defaultConfiguration.fileURL{
        print(fileURL)
    }
}



//Create. id, Datasms 자동생성 입니다.
//getDate, createClass 메소드는 DBUtillity에 있습니다.
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




//Read. id로 PostData를 찾아 배열에 담아 받환합니다.
func readPost(id: Int) -> Array<PostData>{
    let realm = try! Realm()
    let post = realm.objects(PostData.self).filter("id == \(id)")
    let postArray = post.toArray(ofType: PostData.self)

    print(postArray)
    return postArray
}


//Read List. 글목록 전부 반환. 배열처럼 인덱스로 접근 가능. 배열은 아니라고 합니다.
func readPostList() -> Array<PostData> {
    let realm = try! Realm()
    let readAll = realm.objects(PostData.self)
    let PostArray = readAll.toArray(ofType: PostData.self)
    
    print(PostArray)
    return PostArray
}


//Delete. Id로 글을 지우는 방식입니다. 삭제할 떄 현재 글의 id값을 넘겨주어야 합니다.
func Delete(id: Int){
    let realm = try! Realm()
    let user = realm.objects(PostData.self).filter("id == \(id)")
    try! realm.write { realm.delete(user) }
}




// readPost나 readPostList를 할때 결과를 배열로 반환하기 위한 extension입니다.
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        let array = Array(self) as! [T]
        return array
    }
}
