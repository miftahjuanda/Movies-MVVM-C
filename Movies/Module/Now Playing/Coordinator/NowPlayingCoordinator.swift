//
//  NowPlayingCoordinator.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class NowPlayingCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: CoordinatorMovie?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nowPlayingVC = NowPlayingViewController()
        let viewModel = NowPlayingViewModel(provider: NetworkProvider())
        
        nowPlayingVC.nowPlayingCoordinator = self
        nowPlayingVC.nowPlayingViewModel = viewModel
        viewModel.loadDataNowPlaying(page: 1, isRefresh: false)
        viewModel.resultData = {
            DispatchQueue.main.sync {
                self.navigationController.pushViewController(nowPlayingVC, animated: true)
            }
        }
        
    }
    
    func startToDetail(id: Int) {
        let coordinatorDetail = DetailCoordinator(navigationController: navigationController, id: id)
        coordinatorDetail.typeDetail = .nowPlaying
        coordinatorDetail.nowPlayingCoordinator = self
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
