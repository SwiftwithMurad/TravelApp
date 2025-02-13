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
        helper.fetchData { [weak self] travel in
            guard let self = self else { return }
            self.travel = travel
            completion?()
        }
    }
}
