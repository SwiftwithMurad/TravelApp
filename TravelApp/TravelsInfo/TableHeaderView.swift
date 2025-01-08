//
//  TableHeaderView.swift
//  TravelApp
//
//  Created by Mac on 08.01.25.
//

import UIKit

class TableHeaderView: UIView {
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let collection: UICollectionView = {
        let collection = UICollectionView()
        collection.backgroundColor = .red
        return collection
    }()
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func addView() {
        view.addSubview(collection)
    }
}

extension TableHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 100, height: 100)
    }
}


