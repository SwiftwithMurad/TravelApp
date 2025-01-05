//
//  HomeController.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import UIKit

class HomeController: UIViewController {
    var trips = [Travel]()
    var category = [Categories]()
    let jsonHelper = JsonHelper()
    
    @IBOutlet weak var homeCollection: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
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
        }
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: homeCollection.frame.width / 2, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        header.configCategory(category: category)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 120)
    }
}
