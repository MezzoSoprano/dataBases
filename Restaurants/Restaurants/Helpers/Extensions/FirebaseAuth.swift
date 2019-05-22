//
//  FirebaseAuth.swift
//  Restaurants
//
//  Created by Svyatoslav Katola on 5/22/19.
//

import FirebaseAuth

enum CurrentUserState {
    case admin
    case user
    case unAuhtorized
}

let adminsID = ["qHkkCxeUcUcPzabbGJEIDY92AqI2"]


extension Auth {
    
    static func currentUserState() -> CurrentUserState {
        
        guard let userID = Auth.auth().currentUser?.uid else { return .unAuhtorized }
    
        if adminsID.contains(userID) {
            return .admin
        } else { return .user }
    }
}
