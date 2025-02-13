//
//  HeaderCollectionReusableView.swift
//  TravelApp
//
//  Created by Mac on 04.01.25.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    var categories = [Categories]()
    var reloadCategoryData: ((Int) -> Void)?
    var buttonHandler: (() -> Void)?
    
    @IBOutlet private weak var headerCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    func configUI() {
        headerCollection.register(UINib(nibName: "HeaderCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCell")
        headerCollection.delegate = self
        headerCollection.dataSource = self
    }
    
    func configCategory(category: [Categories]) {
        self.categories = category
    }
    
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        buttonHandler?()
    }
}

extension HeaderCollectionReusableView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
        cell.configCell(category: categories[indexPath.row], isSelected: categories[indexPath.row].isSelected ?? false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: headerCollection.frame.width / 3.3, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for(index, _) in categories.enumerated() {
            categories[index].isSelected = index == indexPath.item ? true: false
        }
        reloadCategoryData?(categories[indexPath.row].id ?? 1)
        headerCollection.reloadData()
    }
}
