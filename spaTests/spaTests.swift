//
//  spaTests.swift
//  spaTests
//
//  Created by Sendhil kumar Gurunathan on 10/24/15.
//  Copyright © 2015 Sendhil kumar Gurunathan. All rights reserved.
//

import XCTest
@testable import spa

class spaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMealInitialization() {
        
        var meal = Meal(name: "", photo: nil, rating: 5)
        XCTAssertNil(meal)
        
        meal = Meal(name: "PIZZA", photo: nil, rating: -1)
        XCTAssertNil(meal, "Negative ratings are invalid, be positive")
        
        meal = Meal(name: "PIZZA", photo: nil, rating: 5)
        XCTAssertNotNil(meal)

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
