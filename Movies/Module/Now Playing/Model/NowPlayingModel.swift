//
//  NowPlayingModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

struct NowPlayingModel: Codable {
    let page: Int?
    var results: [ResultNowPlay]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultNowPlay: Codable {
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

extension NowPlayingModel: Equatable {
    static func == (lhs: NowPlayingModel, rhs: NowPlayingModel) -> Bool {
        return lhs.page == rhs.page &&
        lhs.totalPages == rhs.totalPages &&
        lhs.totalResults == rhs.totalResults &&
        lhs.results == rhs.results
    }
}

extension ResultNowPlay: Equatable {
    static func == (lhs: ResultNowPlay, rhs: ResultNowPlay) -> Bool {
        return lhs.id == rhs.id &&
        lhs.overview == rhs.overview &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.title == rhs.title &&
        lhs.posterPath == rhs.posterPath
    }
}

extension ResultNowPlay: Hashable {
    var identifier: Int {
        return "nowPlay-\(id!)".hashValue
    }
}
