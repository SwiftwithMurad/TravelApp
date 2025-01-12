//
//  ProfileController.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit
import Lottie

class ProfileController: UIViewController {
    let manager = UserDefaultsManager()
    var user = [User]()
    
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var nameView: UIView!
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet private weak var profileAnimation: LottieAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configLabels()
    }
    
    func configUI() {
        profileAnimation.backgroundColor = .systemGray5
        profileAnimation.play()
        profileAnimation.loopMode = .loop
        passwordView.layer.cornerRadius = passwordView.frame.height / 2
        emailView.layer.cornerRadius = emailView.frame.height / 2
        nameView.layer.cornerRadius = nameView.frame.height / 2
    }
    
    func configLabels() {
        let filteredUser = user.filter({ $0.email == manager.getString(key: .emailSaved) })
        if let name = nameLabel,
           let password = passwordLabel,
           let email = emailLabel {
            if user.contains(where: { $0.email == manager.getString(key: .emailSaved) }) {
                email.text = filteredUser[0].email
                name.text = filteredUser[0].username
                password.text = filteredUser[0].password
            }
        }
    }
}

