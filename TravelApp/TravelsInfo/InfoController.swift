//
//  InfoController.swift
//  TravelApp
//
//  Created by Mac on 06.01.25.
//

import UIKit

class InfoController: UIViewController {
    var travel: Travel?
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    @IBOutlet private weak var infoTable: UITableView!
    @IBOutlet private weak var heartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configHeader()
    }
    
    func configUI() {
        infoTable.dataSource = self
        infoTable.delegate = self
        infoTable.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        infoTable.separatorStyle = .none
        infoTable.allowsSelection = false
    }
    
    func configHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 400))
        let imageView = UIImageView(image: UIImage(named: "moraineLake"))
        collectionView.backgroundColor = .green
        collectionView.delegate = self
        collectionView.dataSource = self
//        header.addSubview(imageView)
        header.addSubview(collectionView)
        infoTable.tableHeaderView = header
    }
    
    @IBAction func heartButtonTapped(_ sender: Any) {
    
    }
}

extension InfoController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
        if let travel = travel {
            cell.configCell(travel: travel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension InfoController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 100, height: 100)
    }
}
