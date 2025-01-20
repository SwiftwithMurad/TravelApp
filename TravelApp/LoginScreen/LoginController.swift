//
//  LoginController.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import UIKit

class LoginController: UIViewController {
    let viewModel = LoginViewModel()
    
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var passwordFieldView: UIView!
    @IBOutlet private weak var emailFieldView: UIView!
    @IBOutlet private weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configureViewModel()
    }
    
    func configUI() {
        loginView.layer.cornerRadius = 30
        [emailFieldView, passwordFieldView].forEach { view in
            view.layer.cornerRadius = 25
        }
        passwordFieldView.layer.borderWidth = 1
        passwordFieldView.layer.borderColor = UIColor(named: "HomeColor")?.cgColor
    }
    
    func configureViewModel() {
        viewModel.readUserData()
        viewModel.errorAlert = {
            let alertController = UIAlertController(title: "Wrong information", message: "Please enter valid user info", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        controller.viewModel.sendUser = { user in
            self.emailField.text = user.email
            self.passwordField.text = user.password
        }
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        configureViewModel()
        if let email = emailField.text, !email.isEmpty,
           let password = passwordField.text, !password.isEmpty {
            viewModel.config(email: email, password: password)
        }
    }
}

