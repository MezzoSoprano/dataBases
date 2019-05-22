//
//  MainViewController.swift
//  Restaurants
//
//  Created by Svyatoslav Katola on 5/22/19.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    let viewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.barTitle
    }
}

// MARK: - Actions

extension MainViewController {
    
    @IBAction func logOut(_ sender: Any) {
    }
    
    @IBAction func createOrder(_ sender: Any) {
        coordinator?.createOrder()
    }
}
