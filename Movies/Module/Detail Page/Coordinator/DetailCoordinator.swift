//
//  DetailCoordinator.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

class DetailCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private var id: Int?
    
    var typeDetail: TypeDetail?
    var parentCoordinator: CoordinatorMovie?
    var topRateCoordinator: TopRateCoordinator?
    var upcomingCoordinator: UpComingCoordinator?
    var favoriteCoordinator: FavoriteCoordinator?
    var nowPlayingCoordinator: NowPlayingCoordinator?
    
    
    init(navigationController: UINavigationController, id: Int) {
        self.id = id
        self.navigationController = navigationController
    }
    
    func start() {
        let detailVc = DetailViewController()
        let viewModel = DetailViewModel(provider: NetworkProvider())
        
        detailVc.typeDetail = self.typeDetail
        detailVc.viewModel = viewModel
        detailVc.detailCoordinator = self
        viewModel.loadDataDetail(id: id ?? 0)
        viewModel.loadDataReview(id: id ?? 0)
        viewModel.resultData = {
            DispatchQueue.main.sync {
                self.navigationController.pushViewController(detailVc, animated: true)
            }
        }
    }
    
    func didFinishEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishEventDetailTopRate() {
        topRateCoordinator?.childDidFinish(self)
    }
    
    func didFinishEventUpcoming() {
        upcomingCoordinator?.childDidFinish(self)
    }
    
    func didFinishEventNowPlay() {
        nowPlayingCoordinator?.childDidFinish(self)
    }
    
}
