//
//  MoviesTestNegatif.swift
//  MoviesTests
//
//  Created by Miftah Juanda Batubara on 14/02/22.
//

import XCTest
@testable import Movies

class MoviesTestNegatif: XCTestCase {
    
    func test_popular_negative() {
        let case1 = MockNegativeMoviesProvider()
        let viewModel = MovieViewModel(provider: case1)
        let expectation = expectation(description: "")

        viewModel.onFailed = { msg in
            XCTAssertEqual(msg, "Failed Fetch Popula")
            expectation.fulfill()
        }

        viewModel.loadDataMovie(page: 1, isRefresh: false)
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_upcoming_negative() {
        let case1 = MockNegativeMoviesProvider()
        let viewModel = UpComingViewModel(provider: case1)
        let expectation = expectation(description: "")

        viewModel.onFailed = { msg in
            XCTAssertEqual(msg, "Failed Fetch Comin")
            expectation.fulfill()
        }

        viewModel.loadDataUpComing(page: 1, isRefresh: false)
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_TopRated_negative() {
        let case1 = MockNegativeMoviesProvider()
        let viewModel = TopRatedViewModel(provider: case1)
        let expectation = expectation(description: "")

        viewModel.onFailed = { msg in
            XCTAssertEqual(msg, "Failed Fetch Top Rat")
            expectation.fulfill()
        }

        viewModel.loadDataTopRate(page: 1, isRefresh: false)
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_Playing_negative() {
        let case1 = MockNegativeMoviesProvider()
        let viewModel = NowPlayingViewModel(provider: case1)
        let expectation = expectation(description: "")

        viewModel.onFailed = { msg in
            XCTAssertEqual(msg, "Failed Fetch Now Playin›")
            expectation.fulfill()
        }

        viewModel.loadDataNowPlaying(page: 1, isRefresh: false)
        waitForExpectations(timeout: 1, handler: nil)
    }

}
