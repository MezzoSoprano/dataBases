//
//  MainCoordinator.swift
//  Restaurants
//
//  Created by Svyatoslav Katola on 5/22/19.
//

import UIKit
import FirebaseAuth

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func signOut() {
        let vc = AuthViewController.instantiate()
        vc.coordinator = self
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func authDidFinish() {
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.navigationBar.isHidden = false
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createOrder() {
        let vc = CreateOrderViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
