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
        favouritesTable.dataSource = self
        favouritesTable.delegate = self
        helper.fetchData { travel in
            self.travel = travel
        }
    }
}

extension FavouritesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesCell") as! FavouritesCell
        cell.configCell(travel: travel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
