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
    var travel = [TravelList]()
    let jsonHelper = JsonHelper()
    let coreDataHelper = CoreDataHelper()
    
    func readData() {
        jsonHelper.readTravelData { [weak self] travel in
            guard let self = self else { return }
            trips = travel
            existedTrips = trips
        }
    }
    
    func readCoreData() {
        coreDataHelper.fetchData { [weak self] travel in
            guard let self = self else { return }
            self.travel = travel
        }
    }
    
    func saveData(at indexPath: IndexPath) {
        coreDataHelper.saveData(travel: trips[indexPath.row])
    }
    
    func deleteData(travel: TravelList) {
        coreDataHelper.deleteData(travel: travel, completion: nil)
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
