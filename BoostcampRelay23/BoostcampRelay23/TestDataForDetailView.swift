//
//  TestDataForDetailView.swift
//  BoostcampRelay23
//
//  Created by 서명렬 on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import SwiftUI

struct TestDataForDetailView {
  let id = UUID()
  let title = "GitFlow WorkFlow"
  let writer = "gildong"
  let content = """
  새로운 기능은 각각의 브랜치에서 개발하고 백업 및 협업을 위해 중앙 저장소에 푸시합니다. 이 때, master브랜치에서 새 브랜치를 만드는 것이 아니라 develop브랜치에서 새 브랜치를 시작합니다. 기능개발이 끝나면 다시 develop브랜치에 작업 내용을 병합합니다. 즉, 기능 개발을 위한 브랜치는 master브랜치와는 어떠한 상호작용도 하지 않습니다.
  """
  let tranlateContent = """
  New features are developed by each Branch and pushed to central storage for backup and collaboration. At this time, the master Branch does not make a new Branch, but the developer Branch starts a new Branch. When the function development is completed, merge the work into the development brand again. In other words, the Branch for Functional Development has no interaction with the MasterBranch.
  """
  let date = "20.08.07"
}

extension TestDataForDetailView {
  func formattedDate() {
    
  }
}
