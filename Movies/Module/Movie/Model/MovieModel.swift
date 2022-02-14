//
//  MovieModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 09/02/22.
//

import Foundation


struct MovieModel: Codable {
    let page: Int?
    var results: [Result]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let posterPath, releaseDate, overview, title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case overview, title
    }
}

extension MovieModel: Equatable {
    static func == (lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.page == rhs.page &&
        lhs.totalPages == rhs.totalPages &&
        lhs.totalResults == rhs.totalResults &&
        lhs.results == rhs.results
    }
}

extension Result: Equatable {
    static func == (lhs: Result, rhs: Result) -> Bool {
        return lhs.id == rhs.id &&
        lhs.overview == rhs.overview &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.title == rhs.title &&
        lhs.posterPath == rhs.posterPath
    }
}

extension Result: Hashable {
    var identifier: Int {
        return "result-\(id!)".hashValue
    }
}
