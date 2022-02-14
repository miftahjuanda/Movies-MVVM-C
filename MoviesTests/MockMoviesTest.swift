//
//  MockMoviesTest.swift
//  MoviesTests
//
//  Created by Miftah Juanda Batubara on 11/02/22.
//

import Foundation
@testable import Movies

struct MockMoviesTest {
    static func generateMoviesResult() -> MovieModel? {
        
        return MovieModel(page: 1,
                          results: [Result(id: 634649,
                                           posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                                           releaseDate: "2021-12-15",
                                           overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                                           title: "Spider-Man: No Way Home")
                                   ],
                          totalPages: 32315,
                          totalResults: 646290)
    }
    
    static func generateTopRateResult() -> TopRateModel? {
        
        return TopRateModel(page: 1,
                          results: [ResultTopRate(id: 634649,
                                           posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                                           releaseDate: "2021-12-15",
                                           overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                                           title: "Spider-Man: No Way Home")
                                   ],
                          totalPages: 32315,
                          totalResults: 646290)
    }
    
    static func generateUpComingResult() -> UpComingModel? {
        
        return UpComingModel(page: 1,
                          results: [ResultUpComing(id: 634649,
                                           posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                                           releaseDate: "2021-12-15",
                                           overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                                           title: "Spider-Man: No Way Home")
                                   ],
                          totalPages: 32315,
                          totalResults: 646290)
    }
    
    static func generateNowPlayingResult() -> NowPlayingModel? {
        
        return NowPlayingModel(page: 1,
                          results: [ResultNowPlay(id: 634649,
                                           posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                                           releaseDate: "2021-12-15",
                                           overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                                           title: "Spider-Man: No Way Home")
                                   ],
                          totalPages: 32315,
                          totalResults: 646290)
    }
    
    static func generateDetailResult() -> DetailModel? {
        
        return DetailModel(id: 634649,
                           posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                           title: "Spider-Man: No Way Home",
                           overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                           releaseDate: "2021-12-15")
    }
    
    static func generateReviewResult() -> ReviewModel? {
        
        return ReviewModel(id: 634649,
                           page: 1,
                           results: [ ResultReview(author: "Adriano",
                                                   content: "This is the perfect Marvel movie that isn't an Avengers film. It pays off everything thing it builds up, corrects previous misgivings and really gets the character of Spider-Man right. All while setting things up in an interesting way that it's bound to be fresh next time out. Absolutely loved this.",
                                                   id: "61d872c5c669ad00904a2397")
                           ],
                           totalPages: 1,
                           totalResults: 8)
    }
    
}

struct MockPositiveMoviesProvider: ProviderAPI {
    func fetchMoviePopular(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<MovieModel, Error>)) -> Void) {
        guard let data = MockMoviesTest.generateMoviesResult() else { return }
        completion(.success(data))
    }
    
    func fetchMovieDetail(id: Int, completion: @escaping ((NetworkResultHelper<DetailModel, Error>)) -> Void) {
        guard let data = MockMoviesTest.generateDetailResult() else { return }
        completion(.success(data))
    }
    
    func fetchMovieDetailReview(id: Int, completion: @escaping ((NetworkResultHelper<ReviewModel, Error>)) -> Void) {
        guard let data = MockMoviesTest.generateReviewResult() else { return }
        completion(.success(data))
    }
    
    func fetchMovieTopRate(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<TopRateModel, Error>)) -> Void) {
        guard let data = MockMoviesTest.generateTopRateResult() else { return }
        completion(.success(data))
    }
    
    func fetchMovieUpComing(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<UpComingModel, Error>)) -> Void) {
        guard let data = MockMoviesTest.generateUpComingResult() else { return }
        completion(.success(data))
    }
    
    func fetchMovieNowPlaying(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<NowPlayingModel, Error>)) -> Void) {
        guard let data = MockMoviesTest.generateNowPlayingResult() else { return }
        completion(.success(data))
    }
    
}

struct MockNegativeMoviesProvider: ProviderAPI {
    func fetchMoviePopular(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<MovieModel, Error>)) -> Void) {
        completion(.failed("Failed Fetch Popular"))
    }
    
    func fetchMovieDetail(id: Int, completion: @escaping ((NetworkResultHelper<DetailModel, Error>)) -> Void) {
        completion(.failed("Failed Fetch Detail"))
    }
    
    func fetchMovieDetailReview(id: Int, completion: @escaping ((NetworkResultHelper<ReviewModel, Error>)) -> Void) {
        completion(.failed("Failed Fetch Review"))
    }
    
    func fetchMovieTopRate(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<TopRateModel, Error>)) -> Void) {
        completion(.failed("Failed Fetch Top Rated"))
    }
    
    func fetchMovieUpComing(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<UpComingModel, Error>)) -> Void) {
        completion(.failed("Failed Fetch Up Coming"))
    }
    
    func fetchMovieNowPlaying(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<NowPlayingModel, Error>)) -> Void) {
        completion(.failed("Failed Fetch Now Playing"))
    }
    
}
