//
//  FavoriteCoordinator.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class FavoriteCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: CoordinatorMovie?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoriteVC = FavoriteViewController()
        let viewModel = FavoriteViewModel()

        favoriteVC.favoriteCoordinator = self
        favoriteVC.favoriteViewModel = viewModel
        viewModel.loadMovieFavorite()

        self.navigationController.pushViewController(favoriteVC, animated: true)
    }
    
    func startToDetail(id: Int) {
        let coordinatorDetail = DetailCoordinator(navigationController: navigationController, id: id)
        coordinatorDetail.typeDetail = .favorite
        coordinatorDetail.favoriteCoordinator = self
        childCoordinators.append(coordinatorDetail)
        coordinatorDetail.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordin -> Bool in
            return true
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    
    func didFinishEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
    
}
