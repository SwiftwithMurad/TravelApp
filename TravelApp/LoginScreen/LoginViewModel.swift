//
//  LoginViewModel.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import Foundation

class LoginViewModel {
    let manager = UserDefaultsManager()
    let helper = FileManagerHelper()
    var user = [User]()
    
    var successAlert: (() -> Void)?
    var failureAlert: (() -> Void)?
    
    func readTravelData() {
        helper.readData { result in
            self.user = result
        }
    }
}
