//
//  HomeViewModel.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import Foundation

class HomeViewModel {
    var trips = [Travel]()
    var existedTrips = [Travel]()
    var category = [Categories]()
    let jsonHelper = JsonHelper()
    
    func readData() {
        jsonHelper.readCategoryData { categories in
            self.category = categories
        }
        jsonHelper.readTravelData { trips in
            self.trips = trips
            self.existedTrips = trips
        }
    }
    
    func configSearch(search: String, reloadCollection: (() -> Void)) {
        if trips.contains(where: { $0.name?.lowercased() == search }) {
            trips = existedTrips.filter({ $0.name?.lowercased().contains(search) ?? false})
        } else {
            trips = existedTrips
        }
        reloadCollection()
    }
}
