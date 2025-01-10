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
}
