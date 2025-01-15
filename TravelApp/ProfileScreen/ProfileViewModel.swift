//
//  ProfileViewModel.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import Foundation
import UIKit

class ProfileViewModel {
    let userDefaultsManager = UserDefaultsManager()
    var user = [User]()
    let fileManagerHelper = FileManagerHelper()
    
    func configViewModel(completion: ((String, String, String) -> Void)) {
        fileManagerHelper.readData { user in
            self.user = user
        }
        let filteredUser = user.filter({ $0.email == userDefaultsManager.getString(key: .emailSaved) })
        let email = "Email: \(filteredUser[0].email ?? "")"
        let name = "Username: \(filteredUser[0].username ?? "")"
        let password = "Password: \(filteredUser[0].password ?? "")"
        completion(email, name, password)
    }
    
    func configLogoutButton() {
        userDefaultsManager.setValue(value: false, key: .isLoggedIn)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.loginRoot()
        }
    }
}
