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
        jsonHelper.readCategoryData { categories in
            self.category = categories
        }
        jsonHelper.readTravelData { trips in
            self.trips = trips
            self.existedTrips = trips
        }
    }
    
    func readCoreData() {
        coreDataHelper.fetchData { travel in
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
