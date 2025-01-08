//
//  RegisterController.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import UIKit

class RegisterController: UIViewController {
    let helper = FileManagerHelper()
    let manager = UserDefaultsManager()
    var user = [User]()
    var sendDataBack: ((User) -> Void)?
    let viewModel = RegisterViewModel()
    
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var usernameField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        addBottomToEmail(to: emailField, height: 1)
        addBottomToUsername(to: usernameField, height: 1)
        addBottomToPassword(to: passwordField, height: 1)
        viewModel.readData()
    }
    
    func addBottomToEmail(to textField: UITextField, height: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: emailField.frame.height - height, width: emailField.frame.width, height: height)
        bottomLine.backgroundColor = UIColor(named: "HomeColor")?.cgColor
        emailField.layer.addSublayer(bottomLine)
    }
    
    func addBottomToUsername(to textField: UITextField, height: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: usernameField.frame.height - height, width: usernameField.frame.width, height: height)
        bottomLine.backgroundColor = UIColor(named: "HomeColor")?.cgColor
        usernameField.layer.addSublayer(bottomLine)
    }
    
    func addBottomToPassword(to textField: UITextField, height: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: textField.frame.origin.x, y: passwordField.frame.height - height, width: passwordField.frame.width, height: height)
        bottomLine.backgroundColor = UIColor(named: "HomeColor")?.cgColor
        passwordField.layer.addSublayer(bottomLine)
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if let email = emailField.text, !email.isEmpty,
           let username = usernameField.text, !username.isEmpty,
           let password = passwordField.text, !password.isEmpty {
            let users: User = .init(username: username, email: email, password: password)
            user.append(users)
            helper.writeData(user: user)
            sendDataBack?(users)
            navigationController?.popViewController(animated: true)
        }
    }
}
