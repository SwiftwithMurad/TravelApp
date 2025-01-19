//
//  FavouritesViewModel.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import Foundation

class FavouritesViewModel {
    let helper = CoreDataHelper()
    var travel = [TravelList]()
    var trips = [Travel]()
    
    func readData(completion: (() -> Void)?) {
        helper.fetchData { travel in
            self.travel = travel
            completion?()
        }
    }
    
    func deleteData(at indexPath: IndexPath) {
        helper.deleteData(travel: travel[indexPath.row], completion: nil)
    }
}
