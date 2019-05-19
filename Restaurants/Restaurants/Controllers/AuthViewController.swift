//
//  ViewController.swift
//  Restaurants
//
//  Created by Святослав Катола on 5/19/19.
//

import UIKit
import FirebaseUI

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Actions

extension AuthViewController {
    
    @IBAction func login(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        
        guard authUI != nil else {
            return
        }
        
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        let authVC = authUI!.authViewController()
        present(authVC, animated: true) {
            print("good")
        }
    }
}

// MARK: - Auth UI Delegate

extension AuthViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            self.createAlert(title: "Auhtantification error", message: error.localizedDescription)
        } else {
            self.performSegue(withIdentifier: "loginSuccedded", sender: nil)
        }
    }
}

