//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Miftah Juanda Batubara on 08/02/22.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {
    
    func test_positive_popular() {
        let mock = MockPositiveMoviesProvider()
        let viewModel = MovieViewModel(provider: mock)
        guard let dataExpectation = MockMoviesTest.generateMoviesResult()?.results else { return }
        let expectation = expectation(description: "test_positive_popular")
        
        viewModel.resultData = {
            XCTAssertEqual(viewModel.model?.results, dataExpectation)
            expectation.fulfill()
        }
        
        viewModel.loadDataMovie(page: 1, isRefresh: false)
        waitForExpectations(timeout: 3, handler: { error in
            print(error?.localizedDescription ?? "")
        })
    }
    
    func test_positive_Upcoming() {
        let mock = MockPositiveMoviesProvider()
        let viewModel = UpComingViewModel(provider: mock)
        guard let dataExpectation = MockMoviesTest.generateUpComingResult()?.results else { return }
        let expectation = expectation(description: "test_positive_Upcoming")
        
        viewModel.resultData = {
            XCTAssertEqual(viewModel.model?.results, dataExpectation)
            expectation.fulfill()
        }
        
        viewModel.loadDataUpComing(page: 1, isRefresh: false)
        waitForExpectations(timeout: 3, handler: { error in
            print(error?.localizedDescription ?? "")
        })
    }
    
    func test_positive_TopRated() {
        let mock = MockPositiveMoviesProvider()
        let viewModel = TopRatedViewModel(provider: mock)
        guard let dataExpectation = MockMoviesTest.generateTopRateResult()?.results else { return }
        let expectation = expectation(description: "test_positive_TopRated")
        
        viewModel.resultData = {
            XCTAssertEqual(viewModel.model?.results, dataExpectation)
            expectation.fulfill()
        }
        
        viewModel.loadDataTopRate(page: 1, isRefresh: false)
        waitForExpectations(timeout: 3, handler: { error in
            print(error?.localizedDescription ?? "")
        })
    }
    
    func test_positive_Nowplay() {
        let mock = MockPositiveMoviesProvider()
        let viewModel = NowPlayingViewModel(provider: mock)
        guard let dataExpectation = MockMoviesTest.generateNowPlayingResult()?.results else { return }
        let expectation = expectation(description: "test_positive_Nowplay")
        
        viewModel.resultData = {
            XCTAssertEqual(viewModel.model?.results, dataExpectation)
            expectation.fulfill()
        }
        
        viewModel.loadDataNowPlaying(page: 1, isRefresh: false)
        waitForExpectations(timeout: 3, handler: { error in
            print(error?.localizedDescription ?? "")
        })
    }
    
    func test_positive_detail() {
        let mock = MockPositiveMoviesProvider()
        let viewModel = DetailViewModel(provider: mock)
        guard let dataExpectation = MockMoviesTest.generateDetailResult() else { return }
        let expectation = expectation(description: "test_positive_Detail")
        
        viewModel.resultData = {
            XCTAssertEqual(viewModel.model, dataExpectation)
            expectation.fulfill()
        }
        
        viewModel.loadDataDetail(id: 634649)
        waitForExpectations(timeout: 3, handler: { error in
            print(error?.localizedDescription ?? "")
        })
    }
    
    func test_positive_review() {
        let mock = MockPositiveMoviesProvider()
        let viewModel = DetailViewModel(provider: mock)
        guard let dataExpectation = MockMoviesTest.generateReviewResult() else { return }
        let expectation = expectation(description: "test_positive_Review")
        
        viewModel.resultDataReview = {
            XCTAssertEqual(viewModel.modelReview, dataExpectation)
            expectation.fulfill()
        }
        
        viewModel.loadDataReview(id: 634649)
        waitForExpectations(timeout: 3, handler: { error in
            print(error?.localizedDescription ?? "")
        })
    }
    
}
