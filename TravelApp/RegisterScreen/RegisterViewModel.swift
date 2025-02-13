//
//  RegisterViewModel.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import Foundation

class RegisterViewModel {
    let helper = FileManagerHelper()
    let manager = UserDefaultsManager()
    var user = [User]()
    var sendUser: ((User) -> Void)?
    
    func readData() {
        helper.readData { [weak self] user in
            guard let self = self else { return }
            self.user = user
        }
    }
    
    func config(email: String, username: String, password: String) {
        let users: User = .init(username: username, email: email, password: password)
        user.append(users)
        helper.writeData(user: user)
        sendUser?(users)
    }
}
