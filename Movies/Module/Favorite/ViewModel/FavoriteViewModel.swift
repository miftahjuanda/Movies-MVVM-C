//
//  FavoriteViewModel.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import Foundation

class FavoriteViewModel {
    
    var model: [MoviesFavorite]?
    var resultData: (() -> Void)?
    
    func loadMovieFavorite() {
        let data = PersistanceManager.shared.fetchMoviesFavorite()
        self.model = data
        
        if !(model?.isEmpty ?? false) {
            self.resultData?()
        }
    }
    
}
