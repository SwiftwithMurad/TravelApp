//
//  HomeController.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import UIKit

class HomeController: UIViewController {
    var trips = [Travel]()
    var existedTrips = [Travel]()
    var category = [Categories]()
    let jsonHelper = JsonHelper()
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet private weak var homeCollection: UICollectionView!
    @IBOutlet private weak var searchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        let navigationBar = self.navigationController?.navigationBar
        let firstFrame = CGRect(x: 24, y: 0, width: (navigationBar?.frame.width ?? 0) / 2, height: navigationBar?.frame.height ?? 0)
        let secondFrame = CGRect(x: 24, y: 32, width: (navigationBar?.frame.width ?? 0) / 2, height: navigationBar?.frame.height ?? 0)
        let firstLabel = UILabel(frame: firstFrame)
        firstLabel.text = "Location"
        let secondLabel = UILabel(frame: secondFrame)
        secondLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        secondLabel.text = "New York, USA"
        navigationBar?.addSubview(firstLabel)
        navigationBar?.addSubview(secondLabel)
        searchView.layer.cornerRadius = 20
        searchView.layer.borderWidth = 0.5
        homeCollection.dataSource = self
        homeCollection.delegate = self
        homeCollection.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        homeCollection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        jsonHelper.readCategoryData { categories in
            self.category = categories
        }
        jsonHelper.readTravelData { trips in
            self.trips = trips
            self.existedTrips = trips
        }
    }
    
    @IBAction func searchField(_ sender: Any) {
        if let search = searchTextField.text?.lowercased() {
            if trips.contains(where: { $0.name?.lowercased() == search }) {
                trips = trips.filter({ $0.name?.lowercased() == search })
                homeCollection.reloadData()
            } else {
                trips = existedTrips
                homeCollection.reloadData()
            }
        }
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configCell(travel: trips[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 32, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "InfoController") as! InfoController
        controller.hidesBottomBarWhenPushed = true
        controller.travel = trips[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        header.configCategory(category: category)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 200)
    }
}
