//
//  TableList.swift
//  BoostcampRelay23
//
//  Created by In Taek Cho on 2020-08-07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import SwiftUI

struct TableList: View {
//    var listData: [Test] = [Test(title: "Title1", author: "cho"), Test(title: "Title2", author: "cho")]

    var body: some View {
        NavigationView{
            List(listData) { item in
                NavigationLink(destination: DetailView(post: item)){
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(item.getTitle()).bold().font(.title)
                        HStack {
                            Text("작성자 : ")
                            Text(item.getAuthor())
                        }
                        Spacer()
                    }
                }
            }.navigationBarTitle("글 목록 페이지")
        }
    }
}

struct TableList_Previews: PreviewProvider {
    static var previews: some View {
        TableList()
    }
}
