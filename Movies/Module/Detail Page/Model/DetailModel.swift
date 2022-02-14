//
//  DetailModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation


// MARK: - Welcome
struct DetailModel: Codable {
    let id: Int?
    let posterPath: String?
    let title, overview: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

extension DetailModel: Equatable {
    static func == (lhs: DetailModel, rhs: DetailModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.overview == rhs.overview &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.title == rhs.title &&
        lhs.posterPath == rhs.posterPath
    }
}

extension DetailModel: Hashable {
    var identifier: Int {
        return "detail-\(id!)".hashValue
    }
}

