//
//  FavouritesController.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit

class FavouritesController: UIViewController {
    let helper = CoreDataHelper()
    var travel = [TravelList]()
    var travels: Travel?
    
    @IBOutlet private weak var favouritesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        favouritesTable.register(UINib(nibName: "FavouritesCell", bundle: nil), forCellReuseIdentifier: "FavouritesCell")
        helper.fetchData { travel in
            self.travel = travel
        }
        if let travels = travels {
            helper.saveData(travel: travels)
        }
    }
}
