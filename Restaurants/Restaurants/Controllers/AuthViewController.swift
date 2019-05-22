//
//  ViewController.swift
//  Restaurants
//
//  Created by Святослав Катола on 5/19/19.
//

import UIKit
import FirebaseUI

class AuthViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - Actions

extension AuthViewController {
    
    @IBAction func login(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            return
        }
        
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        let authVC = authUI!.authViewController()
        present(authVC, animated: true)
    }
}


// Table View

//extension AuthViewController: UITabBarDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
//    
//    
//}

// MARK: - Auth UI Delegate

extension AuthViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            self.createAlert(title: "Auhtantification error", message: error.localizedDescription)
        } else {
            coordinator?.authDidFinish()
        }
    }
}

