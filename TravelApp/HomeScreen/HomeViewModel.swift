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
    var travel = [TravelList]()
    let coreDataHelper = CoreDataHelper()
    let userDefaultsManager = UserDefaultsManager()
    var isSegmentConfigured = false
    
    func readData() {
        jsonHelper.readCategoryData { [weak self] categories in
            guard let self = self else { return }
            category = categories
        }
        jsonHelper.readTravelData { [weak self] trips in
            guard let self = self else { return }
            self.trips = trips
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
