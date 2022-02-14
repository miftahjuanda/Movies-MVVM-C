//
//  MovieViewModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 09/02/22.
//

import Foundation

class MovieViewModel {
    
    var model: MovieModel?
    //    var model: [Result] = []
    
    let provider: ProviderAPI
    
    var resultData: (() -> Void)?
    var onError: ((Error) -> Void)?
    var onFailed: ((String) -> Void)?
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    
    func loadDataMovie(page: Int, isRefresh: Bool) {
        provider.fetchMoviePopular(page: page, refresh: isRefresh, completion: { [weak self] movieResult in
            
            switch movieResult {
            case let .success(model):
                self?.model = model
                self?.resultData?()
            case let .error(error):
                self?.onError?(error)
                
            case let .failed(failed):
                self?.onFailed?(failed)
            }
        })
    }
    
}
