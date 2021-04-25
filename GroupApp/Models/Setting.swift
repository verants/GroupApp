//
//  Setting.swift
//  GroupApp
//
//  Created by Oksana Tugusheva on 18.04.2021.
//

class Setting {
    let title: String
    let icon: String
    var value: Bool
    
    init(title: String, icon: String, value: Bool) {
        self.title = title
        self.icon = icon
        self.value = value
    }
}

extension Setting {
    static func getDefaultSettings() -> [Setting] {
        var settings: [Setting] = []
        
        for defaultSetting in SettingsManager.shared.defaultSettings {
            let setting = Setting(
                title: defaultSetting.title,
                icon: defaultSetting.icon,
                value: defaultSetting.value
            )
            
            settings.append(setting)
        }
        
        return settings
    }
}
