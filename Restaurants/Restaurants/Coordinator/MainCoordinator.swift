//
//  MainCoordinator.swift
//  Restaurants
//
//  Created by Svyatoslav Katola on 5/22/19.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func authDidFinish() {
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: false)
    }
}
