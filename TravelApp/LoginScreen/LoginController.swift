//
//  LoginController.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import UIKit

class LoginController: UIViewController {
    let manager = UserDefaultsManager()
    let helper = FileManagerHelper()
    var user = [User]()
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordFieldView: UIView!
    @IBOutlet weak var emailFieldView: UIView!
    @IBOutlet weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        loginView.layer.cornerRadius = 30
        emailFieldView.layer.cornerRadius = 25
        passwordFieldView.layer.borderWidth = 1
        passwordFieldView.layer.borderColor = UIColor(named: "HomeColor")?.cgColor
        passwordFieldView.layer.cornerRadius = 25
        helper.readData { user in
            self.user = user
        }
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        navigationController?.show(controller, sender: nil)
        controller.sendDataBack = { user in
            self.emailField.text = user.email
            self.passwordField.text = user.password
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        if let email = emailField.text, !email.isEmpty,
           let password = passwordField.text, !password.isEmpty,
           let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            if user.contains(where: { $0.email == email && $0.password == password }) {
                sceneDelegate.homeRoot()
                manager.setValue(value: true, key: .isLoggedIn)
            } else {
                let alertController = UIAlertController(title: "Wrong information", message: "Please enter valid user info", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alertController.addAction(action)
                present(alertController, animated: true
                )
            }
        }
    }
}
