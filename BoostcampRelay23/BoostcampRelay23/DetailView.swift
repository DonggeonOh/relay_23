//
//  BoardDetailView.swift
//  BoostcampRelay23
//
//  Created by 서명렬 on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import SwiftUI

// 제목 폰트
struct TitleFont: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding(3)
  }
}

// 서브 폰트
struct SubFont: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.subheadline)
      .padding(.horizontal, 3)
  }
}

// MARK:- BoardDetailView
struct DetailView: View {
  @State var isTranslate = false
  var testData = TestDataForDetailView()
  
  var body: some View {
    NavigationView {
      VStack {
        HStack {
          VStack(alignment: .leading, spacing: 5) {
            Text("\(testData.title)")
              
              .modifier(TitleFont())
            Text("작성자: \(testData.writer)")
              .modifier(SubFont())
            Text("작성날짜: \(testData.date)")
              .modifier(SubFont())
          }
          .padding(.top, 15)
          
          Spacer()
          Button(action: {
            self.isTranslate.toggle()
            // TODO:- 번역 작업 불러오기
          }) {
            Text(isTranslate ? "Translate" : "번역하기")
              .padding(5)
              .foregroundColor(.white)
              .background(Color.blue)
              .font(.headline)
              .cornerRadius(10)
            
          }
        }
        .padding(.horizontal, 30)
        .padding(.top, 10)
        
        Spacer()
        
        VStack {
          Text(isTranslate ? "\(testData.tranlateContent)" : "\(testData.content)")
            .layoutPriority(1)
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
        
        Spacer()
      }
      .navigationBarTitle("컨텐츠 페이지", displayMode: .inline)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView()
  }
}
