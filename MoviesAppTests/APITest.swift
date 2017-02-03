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
    
    func testAllMovies() {
        let moviesExpectation = expectation(description: "The API is responding correctly")
        NetworkController.getMovies(offset: 0, genre: .all, completion: {
            movies in
            XCTAssert(movies.count != 0, "Movies array should have some elements")
            for i in 0...3 {
                let movie = movies[i]
                XCTAssertNotNil(movie.title)
                XCTAssertNotNil(movie.summary)
                XCTAssertNotNil(movie.image)
                XCTAssertTrue(movie.title != "", "Movie title should not be empty")
                XCTAssertTrue(movie.summary != "", "Movie summary should not be empty")
                XCTAssertTrue(movie.image != "", "Movie image shoul not be empty")
            }
            moviesExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 10, handler: {
            error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        })
    }
    
    func testMoviesWithGenre() {
        let moviesExpectation = expectation(description: "The API is responding correctly")
        NetworkController.getMovies(offset: 0, genre: .anime, completion: {
            movies in
            XCTAssert(movies.count != 0, "Movies array should have some elements")
            for i in 0...3 {
                let movie = movies[i]
                XCTAssertNotNil(movie.title)
                XCTAssertNotNil(movie.summary)
                XCTAssertNotNil(movie.image)
                XCTAssertTrue(movie.title != "", "Movie title should not be empty")
                XCTAssertTrue(movie.summary != "", "Movie summary should not be empty")
                XCTAssertTrue(movie.image != "", "Movie image shoul not be empty")
            }
            moviesExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 10, handler: {
            error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        })
    }
    
}
