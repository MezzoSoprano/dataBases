//
//  OrderListViewModel.swift
//  Restaurants
//
//  Created by Святослав Катола on 5/23/19.
//

import FirebaseAuth

final class OrderListViewModel {
    
    typealias viewModelType = CurrentUserState
    private var type: viewModelType
    let serice = OrderServiceImpl()
    
    var items = [Order]()
    
    var barTitle: String {
        switch Auth.currentUserState() {
            
        case .admin:
            return "Admin"
        case .user:
            return "User"
        case .unAuhtorized:
            return "Login please!"
        }
    }
    
    init() {
        self.type = Auth.currentUserState()
    }
}

// MARK: - API

extension OrderListViewModel {
    
    func loadItems(handler: @escaping (Error?) -> Void ) {
        
        switch type {
            
        case .admin:
            serice.orders { (result) in
                
                switch result {
                case .success(let models):
                    self.items = models
                    handler(nil)
                case .failure(let error):
                    handler(error)
                }
            }

        case .user:
            serice.ordersForCurrentUser { (result) in
                
                switch result {
                case .success(let models):
                    self.items = models
                    handler(nil)
                case .failure(let error):
                    handler(error)
                }
            }

        case .unAuhtorized:
            print("Unauthorized")
        }
    }
    
    func remove(index: Int, handler: @escaping (Error?) -> Void ) {
        serice.cancelOrder(items[index]) { (result) in
            switch result {

            case .success(_):
                self.items.remove(at: index)
                handler(nil)
            case .failure(let error):
                handler(error)
            }
        }
    }
}
