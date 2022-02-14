//
//  MovieErrorModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 09/02/22.
//

import Foundation

struct MovieErrorModel: Codable {
    let statusCode: Int?
    let statusMessage: String?
    let success: Bool?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
