//
//  TableHeaderView.swift
//  TravelApp
//
//  Created by Mac on 08.01.25.
//

import UIKit

class TableHeaderView: UIView {
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.backgroundColor = .red
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.image = UIImage(named: "moraineLake")
        return image
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collection.delegate = self
        collection.dataSource = self
        collection.addSubview(imageView)
        collection.addSubview(pageControl)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: collection.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: collection.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: collection.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: collection.bottomAnchor, constant: 0),
            pageControl.bottomAnchor.constraint(equalTo: collection.bottomAnchor, constant: 32),
//            pageControl.widthAnchor.constraint(equalTo: widthAnchor, constant: 200),
//            pageControl.heightAnchor.constraint(equalTo: heightAnchor, constant: 50)
        ])
    }
}

extension TableHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .red
        return cell
    }
}


