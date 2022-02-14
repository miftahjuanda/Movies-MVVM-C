//
//  UpComingCoordinator.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class UpComingCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: CoordinatorMovie?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let upComingVC = UpComingViewController()
        let viewModel = UpComingViewModel(provider: NetworkProvider())
        
        upComingVC.upcomingCoordinator = self
        upComingVC.upcomingViewModel = viewModel
        viewModel.loadDataUpComing(page: 1, isRefresh: false)
        viewModel.resultData = {
            DispatchQueue.main.sync {
                self.navigationController.pushViewController(upComingVC, animated: true)
            }
        }
        
    }
    
    func startToDetail(id: Int) {
        let coordinatorDetail = DetailCoordinator(navigationController: navigationController, id: id)
        coordinatorDetail.upcomingCoordinator = self
        coordinatorDetail.typeDetail = .UpComing
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
