//
//  NetworkResultHelper.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 11/02/22.
//

import Foundation

enum NetworkResultHelper<T,Error> {
    case success(T)
    case error(Error)
    case failed(String)
}
