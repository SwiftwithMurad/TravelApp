//
//  ProfileController.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit
import Lottie

class ProfileController: UIViewController {

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var profileAnimation: LottieAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        profileAnimation.backgroundColor = .systemGray5
        profileAnimation.play()
        profileAnimation.loopMode = .loop
        passwordView.layer.cornerRadius = passwordView.frame.height / 2
        emailView.layer.cornerRadius = emailView.frame.height / 2
        nameView.layer.cornerRadius = nameView.frame.height / 2
        emailView.backgroundColor = .home
        emailLabel.textColor = .white
        nameView.backgroundColor = .home
        nameLabel.textColor = .white
        passwordView.backgroundColor = .home
        passwordLabel.textColor = .white
    }
}
