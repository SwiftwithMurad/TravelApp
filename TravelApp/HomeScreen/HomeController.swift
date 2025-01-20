//
//  HomeController.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import UIKit

class HomeController: UIViewController {
    let viewModel =  HomeViewModel()
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var homeCollection: UICollectionView!
    @IBOutlet private weak var searchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.subviews.forEach({ subView in
            if subView is UILabel {
                subView.removeFromSuperview()
            }
        })
    }
    
    func configUI() {
        tabBarController?.tabBar.tintColor = .home
        searchView.layer.cornerRadius = 20
        searchView.layer.borderWidth = 0.5
        homeCollection.dataSource = self
        homeCollection.delegate = self
        homeCollection.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        homeCollection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        viewModel.readData()
    }
    
    func configNavBar() {
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
    }
    
    @IBAction func searchField(_ sender: Any) {
        viewModel.configSearch(search: searchTextField.text ?? "") {
            homeCollection.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configCell(travel: viewModel.trips[indexPath.row])
        cell.heartButtonHandler = {
            if cell.isHeartButtonSelected() {
                print(self.viewModel.trips)
                self.viewModel.saveData(at: indexPath)
            } else {
                print(self.viewModel.coreDataHelper.favouriteTrips)
                //self.viewModel.deleteData(at: indexPath)
//                    self.viewModel.coreDataHelper.deleteData(travel: selectedTrip, completion: nil)
                print(self.viewModel.deleteData(travel: self.viewModel.travel[indexPath.row]))
                self.viewModel.deleteData(travel: self.viewModel.travel[indexPath.row])
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 32, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "InfoController") as! InfoController
        controller.hidesBottomBarWhenPushed = true
        controller.viewModel.travel = viewModel.trips[indexPath.row]
        controller.title = viewModel.trips[indexPath.row].name
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        if !viewModel.isSegmentConfigured {
            header.configCategory(category: viewModel.category)
            viewModel.isSegmentConfigured = true
        }
        header.buttonHandler = {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "TripsController") as! TripsController
            self.navigationController?.show(controller, sender: nil)
        }
        header.reloadCategoryData = { id in
            self.viewModel.trips = self.viewModel.existedTrips.filter({ $0.id == id })
            self.homeCollection.reloadData()
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 200)
    }
}
