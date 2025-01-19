//
//  FavouritesController.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit

class FavouritesController: UIViewController {
    let viewModel = FavouritesViewModel()
    let refreshControl = UIRefreshControl()
    
    @IBOutlet private weak var favouritesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        favouritesTable.register(UINib(nibName: "FavouritesCell", bundle: nil), forCellReuseIdentifier: "FavouritesCell")
        favouritesTable.dataSource = self
        favouritesTable.delegate = self
        viewModel.readData {
            self.favouritesTable.reloadData()
        }
        favouritesTable.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc func refreshData() {
        viewModel.readData {
            self.favouritesTable.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

extension FavouritesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesCell") as! FavouritesCell
        cell.configCell(travel: viewModel.travel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { action, view, completionHandler in
            NotificationCenter.default.post(name: .favouritesUpdated, object: self.viewModel.travel[indexPath.row].countryName)
            self.viewModel.helper.deleteData(travel: self.viewModel.travel[indexPath.row], completion: nil)
            self.viewModel.travel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = UIColor.home
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
