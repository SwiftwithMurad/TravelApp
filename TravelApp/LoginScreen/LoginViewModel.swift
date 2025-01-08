//
//  LoginViewModel.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import Foundation
import UIKit

class LoginViewModel {
    let manager = UserDefaultsManager()
    let helper = FileManagerHelper()
    var user = [User]()
    
    var successAlert: (() -> Void)?
    var errorAlert: (() -> Void)?
    
    func readTravelData() {
        helper.readData { result in
            self.user = result
        }
    }
    
    func config(email: String, password: String) {
        if user.contains(where: { $0.email == email && $0.password == password }) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            sceneDelegate?.homeRoot()
            manager.setValue(value: true, key: .isLoggedIn)
            successAlert?()
        } else {
            errorAlert?()
        }
    }
}
