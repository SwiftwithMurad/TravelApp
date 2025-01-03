//
//  LoginController.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import UIKit

class LoginController: UIViewController {
    
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
        addBottomToBorder(to: signUpButton, color: .white, height: 1)
    }
    
    func addBottomToBorder(to button: UIButton, color: UIColor, height: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: signUpButton.frame.height - height, width: signUpButton.frame.width - height , height: height)
        bottomLine.backgroundColor = color.cgColor
        button.layer.addSublayer(bottomLine)
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        
    }
}
