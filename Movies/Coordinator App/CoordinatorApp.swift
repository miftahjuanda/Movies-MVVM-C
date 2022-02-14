//
//  CoordinatorApp.swift
//  Movies
//
//  Created by Miftah Juanda Batubara on 12/02/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

//Coordinator pattern app
final class CoordinatorApp {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(named: "Color-1")
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.compactAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController.navigationBar.barTintColor = UIColor(named: "Color-1")
            navigationController.navigationItem.titleView?.tintColor = .white
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        let mainPageCoordinator = CoordinatorMovie(navigationController: navigationController)
        childCoordinators.append(mainPageCoordinator)
        mainPageCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

