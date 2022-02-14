//
//  NetworkProvider.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 11/02/22.
//

import Foundation

protocol ProviderAPI {
    func fetchMoviePopular(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<MovieModel, Error>)) -> Void)
    
    func fetchMovieDetail(id: Int, completion: @escaping ((NetworkResultHelper<DetailModel, Error>)) -> Void)
    
    func fetchMovieDetailReview(id: Int, completion: @escaping ((NetworkResultHelper<ReviewModel, Error>)) -> Void)
    
    func fetchMovieTopRate(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<TopRateModel, Error>)) -> Void)
    
    func fetchMovieUpComing(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<UpComingModel, Error>)) -> Void)
    
    func fetchMovieNowPlaying(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<NowPlayingModel, Error>)) -> Void)
}

//Handling Network
struct NetworkProvider: ProviderAPI {
    
    func fetchMovieTopRate(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<TopRateModel, Error>)) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(ApiKey)&language=en-US&page=\(page)") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.error(error))
                    
                } else {
                    if let result = try? JSONDecoder().decode(TopRateModel.self, from: data!) {
                        completion(.success(result))
                        
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.error(error))
        }
    }
    
    func fetchMovieUpComing(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<UpComingModel, Error>)) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(ApiKey)&language=en-US&page=\(page)") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.error(error))
                    
                } else {
                    if let result = try? JSONDecoder().decode(UpComingModel.self, from: data!) {
                        completion(.success(result))
                        
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.error(error))
        }
    }
    
    func fetchMovieNowPlaying(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<NowPlayingModel, Error>)) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(ApiKey)&language=en-US&page=\(page)") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.error(error))
                    
                } else {
                    if let result = try? JSONDecoder().decode(NowPlayingModel.self, from: data!) {
                        completion(.success(result))
                        
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.error(error))
        }
    }
    
    func fetchMovieDetailReview(id: Int, completion: @escaping ((NetworkResultHelper<ReviewModel, Error>)) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/reviews?api_key=\(ApiKey)&language=en-US&page=1") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.error(error))
                    
                } else {
                    if let result = try? JSONDecoder().decode(ReviewModel.self, from: data!) {
                        completion(.success(result))
                        
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.error(error))
        }
    }
    
    func fetchMovieDetail(id: Int, completion: @escaping ((NetworkResultHelper<DetailModel, Error>)) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(ApiKey)&language=en-US") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.error(error))
                    
                } else {
                    if let result = try? JSONDecoder().decode(DetailModel.self, from: data!) {
                        completion(.success(result))
                        
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.error(error))
        }
        
    }
    
    
    func fetchMoviePopular(page: Int, refresh: Bool, completion: @escaping ((NetworkResultHelper<MovieModel, Error>)) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(ApiKey)&language=en-US&page=\(page)") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.error(error))
                    
                } else {
                    if let result = try? JSONDecoder().decode(MovieModel.self, from: data!) {
                        completion(.success(result))
                        
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.error(error))
        }
    }
    
}
