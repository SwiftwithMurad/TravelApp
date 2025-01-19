//
//  TripsViewModel.swift
//  TravelApp
//
//  Created by Mac on 10.01.25.
//

import Foundation

class TripsViewModel {
    var trips = [Travel]()
    var existedTrips = [Travel]()
    let jsonHelper = JsonHelper()
    let coreDataHelper = CoreDataHelper()
    
    func readData() {
        jsonHelper.readTravelData { travel in
            trips = travel
            existedTrips = trips
        }
    }
    
    func configSearch(search: String, reloadCollection: (() -> Void)) {
        if !search.isEmpty {
            trips = existedTrips.filter({ $0.name?.lowercased().contains(search) ?? false})
        } else {
            trips = existedTrips
        }
        reloadCollection()
    }
}
