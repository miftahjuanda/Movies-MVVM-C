//
//  NowPlayingViewModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

class NowPlayingViewModel {
    
    var model: NowPlayingModel?
    
    let provider: ProviderAPI
    
    var resultData: (() -> Void)?
    var onError: ((Error) -> Void)?
    var onFailed: ((String) -> Void)?
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    
    func loadDataNowPlaying(page: Int, isRefresh: Bool) {
        provider.fetchMovieNowPlaying(page: page, refresh: isRefresh, completion: { [weak self] movieResult in
 
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
