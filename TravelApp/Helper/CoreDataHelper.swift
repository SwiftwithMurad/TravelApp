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
        newFavouriteTrips.tripName = travel.name
        newFavouriteTrips.countryName = travel.country
        newFavouriteTrips.image = travel.image.first
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(travel: TravelList, completion: (() -> Void)?) {
        context.delete(travel)
        do {
            try context.save()
            NotificationCenter.default.post(name: Notification.Name("favouriteDeleted"), object: travel.tripName)
            completion?()
        } catch {
            print(error.localizedDescription)
        }
    }
}
