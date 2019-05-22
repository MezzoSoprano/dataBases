//
//  OrderListViewModel.swift
//  Restaurants
//
//  Created by Святослав Катола on 5/23/19.
//

import FirebaseAuth

//enum OrderListType {
//
//    case user, admin, unAuhtorized
//
//    init(state: CurrentUserStare) {
//
//        switch state {
//        case .user:
//            self = .user
//        case .admin:
//            self = .admin
//        case .unAuhtorized:
//            self = .unAuhtorized
//        }
//    }
//}

final class OrderListViewModel {
    
    typealias viewModelType = CurrentUserState
    private var type: viewModelType
    
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

