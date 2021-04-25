//
//  SettingsManager.swift
//  GroupApp
//
//  Created by Oksana Tugusheva on 18.04.2021.
//

class SettingsManager {
    static let shared = SettingsManager()
    
    let defaultSettings = [
        ( title: "Show Password", icon: "eye.fill", value: false ),
        ( title: "Group By Type", icon: "square.grid.2x2.fill", value: true )
    ]
    
    private init() {}
}
