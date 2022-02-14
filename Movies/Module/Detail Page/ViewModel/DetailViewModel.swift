//
//  DetailViewModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

class DetailViewModel {
    
    let provider: ProviderAPI
    var model: DetailModel?
    var modelReview: ReviewModel?
    
    var resultDataReview: (() -> Void)?
    var onErrorReview: ((Error) -> Void)?
    var onFailedReview: ((String) -> Void)?
    
    var resultData: (() -> Void)?
    var onError: ((Error) -> Void)?
    var onFailed: ((String) -> Void)?
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    func loadDataDetail(id: Int) {
        provider.fetchMovieDetail(id: id, completion: { [weak self] detailResult in
            switch detailResult {
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
    
    func loadDataReview(id: Int) {
        provider.fetchMovieDetailReview(id: id, completion: { [weak self] detailResult in
            switch detailResult {
            case let .success(model):
                self?.modelReview = model
                self?.resultDataReview?()
                
            case let .error(error):
                self?.onErrorReview?(error)
                
            case let .failed(failed):
                self?.onFailedReview?(failed)
            }
        })
    }
    
}
