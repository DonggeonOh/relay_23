//
//  TranslationAPI.swift
//  BoostcampRelay23
//
//  Created by 김신우 on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import Foundation

class TranslationAPI {
    
    static let shared = TranslationAPI()
    
    private let userId = "fbQGeroPJrh5KujDy10J"
    private let key = "yGT4cqYk0b"
    private var request = URLRequest(url: URL(string: "https://openapi.naver.com/v1/papago/n2mt")!)
    
    private init(){
        // url request 정의
        request.httpMethod = "POST"
        request.addValue(userId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(key, forHTTPHeaderField: "X-Naver-Client-Secret")
    }
    
    
    func translate(text: String,_ callback: @escaping (String)->Void) {
        let param = "source=ko&target=en&text=\(text)"
        let paramData = param.data(using: .utf8)
        
        request.httpBody = paramData
        request.setValue(String(paramData!.count),forHTTPHeaderField: "Content-Length")
        
        let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let data = data {
                //TODO: str to json or data to json
                let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
                callback(str)
            } else {
                callback("")
            }
        }
        dataTask.resume()
    }
    
    
    
    
}

