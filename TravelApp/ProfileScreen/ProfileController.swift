//
//  ProfileController.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit
import Lottie

class ProfileController: UIViewController {
    let viewModel = ProfileViewModel()
    
    @IBOutlet private weak var generalLabelView: UIView!
    @IBOutlet private weak var profileAnimation: LottieAnimationView!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var nameView: UIView!
    @IBOutlet private weak var emailView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        generalLabelView.layer.cornerRadius = 30
        profileAnimation.play()
        profileAnimation.loopMode = .loop
        [emailView, nameView, passwordView].forEach { view in
            view.layer.cornerRadius = view.frame.height / 2
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.home.cgColor
        }
        viewModel.configViewModel { [weak self] email, name, password in
            guard let self = self else { return }
            emailLabel.text = email
            nameLabel.text = name
            passwordLabel.text = password
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        viewModel.configLogoutButton()
    }
}
