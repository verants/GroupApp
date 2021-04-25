//
//  TabBarController.swift
//  GroupApp
//
//  Created by Oksana Tugusheva on 18.04.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    let settings = Setting.getDefaultSettings()

    override func viewDidLoad() {
        super.viewDidLoad()

        let settingsViewController = viewControllers?.last as! SettingsTableViewController

        settingsViewController.settings = settings
    }
}
