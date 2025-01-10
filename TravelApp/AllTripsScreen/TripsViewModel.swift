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
    var jsonHelper = JsonHelper()
    
    func readData() {
        jsonHelper.readTravelData { travel in
            trips = travel
            existedTrips = trips
        }
    }
    
    func configSearch(search: String, reloadCollection: (() -> Void)) {
        if trips.contains(where: { $0.name?.lowercased() == search}) {
            trips = existedTrips.filter({ $0.name?.lowercased().contains(search) ?? false})
        } else {
            trips = existedTrips
        }
        reloadCollection()
    }
}
