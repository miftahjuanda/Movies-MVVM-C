//
//  UpComingModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

struct UpComingModel: Codable {
    let page: Int?
    var results: [ResultUpComing]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultUpComing: Codable {
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

extension UpComingModel: Equatable {
    static func == (lhs: UpComingModel, rhs: UpComingModel) -> Bool {
        return lhs.page == rhs.page &&
        lhs.totalPages == rhs.totalPages &&
        lhs.totalResults == rhs.totalResults &&
        lhs.results == rhs.results
    }
}

extension ResultUpComing: Equatable {
    static func == (lhs: ResultUpComing, rhs: ResultUpComing) -> Bool {
        return lhs.id == rhs.id &&
        lhs.overview == rhs.overview &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.title == rhs.title &&
        lhs.posterPath == rhs.posterPath
    }
}

extension ResultUpComing: Hashable {
    var identifier: Int {
        return "resultUpcoming-\(id!)".hashValue
    }
}
