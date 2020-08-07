//
//  TranslationAPI.swift
//  BoostcampRelay23
//
//  Created by 김신우 on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import Foundation


class TranslationAPI {

    func callURL(){
        let text = "test 문서입니다."
        let param = "source=ko&target=en&text=\(text)"
        let paramData = param.data(using: .utf8)
        let Naver_URL = URL(string: "https://openapi.naver.com/v1/papago/n2mt")
        
        let ClientID = "fbQGeroPJrh5KujDy10J"
        let ClientSecret = "yGT4cqYk0b"
        
        
        
        //Request
        var request = URLRequest(url: Naver_URL!)
        request.httpMethod = "POST"
        request.addValue(ClientID,forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(ClientSecret,forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = paramData
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        
        //Session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        //Task
        let task = session.dataTask(with: request) { (data, response, error) in
            //통신 성공
            if let data = data {
                let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
                print(str)
                
                DispatchQueue.main.async {
                    print(str)
                }
                
            }
            //통신 실패
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
    }

}
