//
//  CoreDataHelper.swift
//  TravelApp
//
//  Created by Mac on 10.01.25.
//

import Foundation

class CoreDataHelper {
    let context = AppDelegate().persistentContainer.viewContext
    var favouriteTrips = [TravelList]()
    
    func fetchData(completion: (([TravelList]) -> Void)) {
        do {
            favouriteTrips = try context.fetch(TravelList.fetchRequest())
            print(favouriteTrips)
            completion(favouriteTrips)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(travel: Travel) {
        let newFavouriteTrips = TravelList(context: context)
        newFavouriteTrips.countryName = travel.country
        newFavouriteTrips.image = travel.image.first
        newFavouriteTrips.tripName = travel.name
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(at indexPath: IndexPath) {
        let deletedTrips = favouriteTrips[indexPath.row]
        context.delete(deletedTrips)
        favouriteTrips.remove(at: indexPath.row)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
