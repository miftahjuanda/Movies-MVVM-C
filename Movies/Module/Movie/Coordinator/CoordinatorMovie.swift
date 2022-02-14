//
//  CoordinatorMovie.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 09/02/22.
//

import UIKit

final class CoordinatorMovie: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let movieVC = MovieViewController()
        let viewModel = MovieViewModel(provider: NetworkProvider())
        
        movieVC.movieCoordinator = self
        movieVC.viewModel = viewModel
        viewModel.loadDataMovie(page: 1, isRefresh: false)
        viewModel.resultData = {
            DispatchQueue.main.sync {
                self.navigationController.setViewControllers([movieVC], animated: true)
            }
        }
    }
    
    func startToDetail(id: Int) {
        let coordinatorDetail = DetailCoordinator(navigationController: navigationController, id: id)
        coordinatorDetail.parentCoordinator = self
        coordinatorDetail.typeDetail = .popular
        childCoordinators.append(coordinatorDetail)
        coordinatorDetail.start()
    }
    
    func startToTopRated() {
        let coordinatorTopRate = TopRateCoordinator(navigationController: navigationController)
        coordinatorTopRate.parentCoordinator = self
        childCoordinators.append(coordinatorTopRate)
        coordinatorTopRate.start()
    }
    
    func startToUpComing() {
        let coordinatorTopRate = UpComingCoordinator(navigationController: navigationController)
        coordinatorTopRate.parentCoordinator = self
        childCoordinators.append(coordinatorTopRate)
        coordinatorTopRate.start()
    }
    
    func startToNowPlaying() {
        let coordinatorTopRate = NowPlayingCoordinator(navigationController: navigationController)
        coordinatorTopRate.parentCoordinator = self
        childCoordinators.append(coordinatorTopRate)
        coordinatorTopRate.start()
    }
    
    func startToFavorite() {
        let coordinatorFavorite = FavoriteCoordinator(navigationController: navigationController)
        coordinatorFavorite.parentCoordinator = self
        childCoordinators.append(coordinatorFavorite)
        coordinatorFavorite.start()
    }
    
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordin -> Bool in
            return true
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
}
