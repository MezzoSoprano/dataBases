//
//  MainViewController.swift
//  Restaurants
//
//  Created by Svyatoslav Katola on 5/22/19.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class MainViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "cell"
    
    weak var coordinator: MainCoordinator?
    var viewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.barTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel = OrderListViewModel()
        viewModel.loadItems(handler: updateView(error:))
    }
    
    func updateView(error: Error?) {
        
        if let err = error {
            createAlert(title: "Error", message: err.localizedDescription)
        } else {
            tableView.reloadData()
        }
    }
}

// MARK: - Actions

extension MainViewController {
    
    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            coordinator?.signOut()
        } catch {
            createAlert(title: "Sign Out error", message: error.localizedDescription)
        }
    }
    
    @IBAction func createOrder(_ sender: Any) {
        coordinator?.createOrder()
    }
}

// MARK: - Table View

extension MainViewController: UITabBarDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = viewModel.items[indexPath.row].restaurantName
        cell.detailTextLabel?.text = "by \(viewModel.items[indexPath.row].customerName), at \(viewModel.items[indexPath.row].dateString)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            viewModel.remove(index: indexPath.row, handler: updateView(error:))
        }
    }
}
