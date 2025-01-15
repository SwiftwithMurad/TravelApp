//
//  TableHeaderView.swift
//  TravelApp
//
//  Created by Mac on 08.01.25.
//

import UIKit

class TableHeaderView: UIView {
    var travel: Travel?
    let jsonHelper = JsonHelper()
    var index = 0
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(TableHeaderCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: 0, width: 100, height: 400)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collection.delegate = self
        collection.dataSource = self
        collection.addSubview(pageControl)
        configConstraint()
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollingSetup), userInfo: nil, repeats: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func scrollingSetup() {
        if index < (travel?.image.count ?? 1) - 1 {
            index += 1
        } else {
            index = 0
        }
        pageControl.numberOfPages = travel?.image.count ?? 1
        pageControl.currentPage = index
        collection.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
    }
    
    func configConstraint() {
        addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            pageControl.centerXAnchor.constraint(equalTo: collection.centerXAnchor, constant: 0),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}

extension TableHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travel?.image.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TableHeaderCell
        cell.configImage(imageName: travel?.image[indexPath.row] ?? "")
        cell.addSubview(pageControl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 400)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / collection.frame.width)
        pageControl.currentPage = page
    }
}


