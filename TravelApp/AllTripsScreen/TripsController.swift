//
//  TripsController.swift
//  TravelApp
//
//  Created by Mac on 10.01.25.
//

import UIKit

class TripsController: UIViewController {
    let viewModel = TripsViewModel()

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        title = "All Trips"
        searchView.layer.cornerRadius = 20
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        viewModel.readData()
    }
    
    @IBAction func searchField(_ sender: Any) {
        if let search = searchTextField.text?.lowercased() {
            if viewModel.trips.contains(where: { $0.name?.lowercased() == search }) {
                viewModel.trips = viewModel.trips.filter({ $0.name?.lowercased() == search})
                collection.reloadData()
            } else {
                viewModel.trips = viewModel.existedTrips
                collection.reloadData()
            }
        }
    }
}

extension TripsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configCell(travel: viewModel.trips[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 32, height: 220)
    }
}
