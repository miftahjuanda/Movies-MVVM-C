//
//  UpComingViewModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

class UpComingViewModel {
    
    var model: UpComingModel?
    
    let provider: ProviderAPI
    
    var resultData: (() -> Void)?
    var onError: ((Error) -> Void)?
    var onFailed: ((String) -> Void)?
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    
    func loadDataUpComing(page: Int, isRefresh: Bool) {
        provider.fetchMovieUpComing(page: page, refresh: isRefresh, completion: { [weak self] movieResult in
            
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
