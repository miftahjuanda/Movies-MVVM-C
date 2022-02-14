//
//  TopRateModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

struct TopRateModel: Codable {
    let page: Int?
    var results: [ResultTopRate]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultTopRate: Codable {
    let id: Int?
    let posterPath, releaseDate, overview, title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case overview
        case title
    }
}

extension TopRateModel: Equatable {
    static func == (lhs: TopRateModel, rhs: TopRateModel) -> Bool {
        return lhs.page == rhs.page &&
        lhs.totalPages == rhs.totalPages &&
        lhs.totalResults == rhs.totalResults &&
        lhs.results == rhs.results
    }
}

extension ResultTopRate: Equatable {
    static func == (lhs: ResultTopRate, rhs: ResultTopRate) -> Bool {
        return lhs.id == rhs.id &&
        lhs.overview == rhs.overview &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.title == rhs.title &&
        lhs.posterPath == rhs.posterPath
    }
}

extension ResultTopRate: Hashable {
    var identifier: Int {
        return "resultToprated-\(id!)".hashValue
    }
}
