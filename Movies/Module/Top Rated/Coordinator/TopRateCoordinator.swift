//
//  TopRateCoordinator.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class TopRateCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    var parentCoordinator: CoordinatorMovie?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRateVC = TopRateViewController()
        let viewModel = TopRatedViewModel(provider: NetworkProvider())
        
        topRateVC.topRateCoordinator = self
        topRateVC.topRateViewModel = viewModel
        viewModel.loadDataTopRate(page: 1, isRefresh: false)
        viewModel.resultData = {
            DispatchQueue.main.sync {
                self.navigationController.pushViewController(topRateVC, animated: true)
            }
        }
        
    }
    
    func startToDetail(id: Int) {
        let coordinatorDetail = DetailCoordinator(navigationController: navigationController, id: id)
        coordinatorDetail.topRateCoordinator = self
        coordinatorDetail.typeDetail = .TopRated
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
