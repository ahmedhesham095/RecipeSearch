//
//  RecipeSearchTests.swift
//  RecipeSearchTests
//
//  Created by Ahmed Hesham on 9/3/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import XCTest
@testable import RecipeSearch

class RecipeSearchTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testLoadingPost() {
        let recipeExpectation = expectation(description: "searchForRecipes")
        
        APIManager.apiSharredInistance.searchFood(with: "Chicken", and: 0, and: 10) { (isSuccessful, result)
            in
            if isSuccessful {
                XCTAssertTrue(isSuccessful)
            } else {
                XCTFail("ERROR Fetching Data")
            }
            recipeExpectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}

