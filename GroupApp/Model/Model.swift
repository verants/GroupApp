//
//  Model.swift
//  GroupApp
//
//  Created by Aleksandr Rybachev on 17.04.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    let loginIcon: String
    let passwordIcon: String
    
    static func getUserData() -> User {
        User(
            login: DataManager.shared.loginDM,
            password: DataManager.shared.passwordDM,
            loginIcon: DataManager.shared.loginIconDM,
            passwordIcon: DataManager.shared.passwordIconDM
        )
    }
    
}
