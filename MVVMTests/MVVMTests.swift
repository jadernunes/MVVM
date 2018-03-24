//
//  MVVMTests.swift
//  MVVMTests
//
//  Created by Jáder Borba Nunes on 28/02/18.
//  Copyright © 2018 jader. All rights reserved.
//

import XCTest
@testable import MVVM

let timeoutApi = 30.0

class MVVMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRequestRandomData(){
        let expec = self.expectation(description: #function)
        
        let controller = RNDController()
        controller.requestNewData { (model: RNDModel?) in
            expec.fulfill()
            
            //test if model exist
            XCTAssertNotNil(model)
            guard let model = model else { return }
            
            //test if model has a title
            XCTAssertFalse(model.getTitle().isEmpty)
        }
        
        waitForExpectations(timeout: timeoutApi, handler: nil)
    }
}
