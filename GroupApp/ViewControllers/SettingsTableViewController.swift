//
//  SettingsTableViewController.swift
//  GroupApp
//
//  Created by Oksana Tugusheva on 18.04.2021.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var settings: [Setting]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.title = "Settings"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting", for: indexPath)
        let setting = settings[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(systemName: setting.icon)
        content.imageProperties.tintColor = .black
        content.imageProperties.maximumSize = CGSize(width: 28, height: 28)
        
        content.text = setting.title
        
        let uiSwitch = UISwitch()
        uiSwitch.isOn = setting.value
        uiSwitch.tag = indexPath.row
        uiSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = uiSwitch
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc private func switchChanged(_ sender: UISwitch) {
        settings[sender.tag].value = !settings[sender.tag].value
    }
}
