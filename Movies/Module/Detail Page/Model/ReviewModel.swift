//
//  ReviewModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

// MARK: - Welcome
struct ReviewModel: Codable {
    let id, page: Int?
    let results: [ResultReview]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultReview: Codable {
    let author: String?
    let content, id: String?
    
    enum CodingKeys: String, CodingKey {
        case author
        case content
        case id
    }
}

extension ReviewModel: Hashable {
    var identifier: Int {
        return "review-\(id!)".hashValue
    }
}

extension ReviewModel: Equatable {
    static func == (lhs: ReviewModel, rhs: ReviewModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.page == rhs.page &&
        lhs.totalPages == rhs.totalPages &&
        lhs.totalResults == rhs.totalResults &&
        lhs.results == rhs.results
    }
}

extension ResultReview: Equatable {
    static func == (lhs: ResultReview, rhs: ResultReview) -> Bool {
        return lhs.id == rhs.id &&
        lhs.author == rhs.author &&
        lhs.content == rhs.content
    }
}

extension ResultReview: Hashable {
    var identifier: Int {
        return "resultReview-\(id!)".hashValue
    }
}

