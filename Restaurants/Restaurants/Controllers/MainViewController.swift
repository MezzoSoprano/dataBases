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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Auth.currentUserState())
    }
}
