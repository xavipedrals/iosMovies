//
//  APITest.swift
//  MoviesApp
//
//  Created by jedi17 on 2/2/17.
//  Copyright © 2017 jedi. All rights reserved.
//

import XCTest
@testable import MoviesApp

class APITest: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
    
    func testAllMovies() {
        NetworkController.getMovies(offset: 0, completion: {
            movies in
            XCTAssert(movies.count != 0, "Movies array should have some elements")
            for i in 0...3 {
                let movie = movies[i]
                XCTAssertTrue(movie.title != "", "Movie title should not be empty")
                XCTAssertTrue(movie.summary != "", "Movie summary should not be empty")
                XCTAssertTrue(movie.director == "Sida", "Movie should have a director")
            }
        })
    }
    
}
