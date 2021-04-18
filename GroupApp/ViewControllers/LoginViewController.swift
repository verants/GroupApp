//
//  LoginViewController.swift
//  GroupApp
//
//  Created by Aleksandr Rybachev on 17.04.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginIconImage: UIImageView!
    @IBOutlet var passwordIconImage: UIImageView!
    
    @IBOutlet var showPassSwitch: UISwitch!
    
    @IBOutlet var loginButton: UIButton!
    
    
    // MARK: - Private properties
    private let user = User.getUserData()
    
    let primaryColor = UIColor(
        red: 58/255,
        green: 91/255,
        blue: 222/255,
        alpha: 1
    )
    let secondaryColor = UIColor(
        red: 153/255,
        green: 211/255,
        blue: 247/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        loginIconImage.image = UIImage(named: user.loginIcon)
        passwordIconImage.image = UIImage(named: user.passwordIcon)
        
        loginIconImage.contentMode = .scaleAspectFit
        passwordIconImage.contentMode = .scaleAspectFit
        
//        loginIconImage.image = CGSize(width: 30, height: 30)
//        passwordIconImage.image = CGSize(width: 30, height: 30)
//
//        loginIconImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        passwordIconImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        loginButton.layer.cornerRadius = 10
    }
    
    // MARK: - IBAction
    @IBAction func showPasswordSwitch() {
        passwordTF.isSecureTextEntry.toggle()
    }
    
    @IBAction func loginInButton() {
        if loginTF.text != user.login || passwordTF.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
            return
        }
    }
    
    @IBAction func forgotLoginOrPassword(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(user.login)")
            : showAlert(title: "Oops!", message: "Your password is \(user.password)")
    }
    

}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginInButton()
            performSegue(withIdentifier: "showNC", sender: nil)
        }
        return true
    }
}
