//
//  BoostcampRelay23Tests.swift
//  BoostcampRelay23Tests
//
//  Created by Oh Donggeon on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import XCTest
@testable import BoostcampRelay23

class BoostcampRelay23Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_translationAPI_request() {
        let sem = DispatchSemaphore.init(value: 0)
        TranslationAPI.shared.translate(text: "테스트용 텍스트 입니다."){ result in
            print(result)
            XCTAssertTrue(result != "")
            sem.signal()
        }
        sem.wait()
    }

}
