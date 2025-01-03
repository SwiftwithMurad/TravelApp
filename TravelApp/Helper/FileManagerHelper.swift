//
//  FileManagerHelper.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import Foundation

class FileManagerHelper {
    
    func getFilePath() -> URL {
        let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = file[0].appendingPathComponent("User.json")
        print(path)
        return path
    }
    
    func writeData(user: [User]) {
        do {
            let data = try JSONEncoder().encode(user)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readData(completion: (([User]) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let user = try JSONDecoder().decode([User].self, from: data)
                completion(user)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
