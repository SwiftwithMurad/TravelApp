//
//  JsonHelper.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import Foundation

class JsonHelper {
    var categories = [Categories]()
    var trips = [Travel]()
    
    func readCategoryData(completion: (([Categories]) -> Void)) {
        if let fileUrl = Bundle.main.url(forResource: "Categories", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                categories = try JSONDecoder().decode([Categories].self, from: data)
                completion(categories)
            }
            catch {
               print(error.localizedDescription)
           }
        }
    }
    
    func readTravelData(completion: (([Travel]) -> Void)) {
        if let fileUrl = Bundle.main.url(forResource: "Travels", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                trips = try JSONDecoder().decode([Travel].self, from: data)
                completion(trips)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
