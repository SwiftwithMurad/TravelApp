//
//  CategoryCell.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    var heartButtonHandler: (() -> Void)?
    let manager = UserDefaultsManager()
    
    @IBOutlet private weak var heartButton: UIButton!
    @IBOutlet private weak var countryName: UILabel!
    @IBOutlet private weak var cellLabel: UILabel!
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        heartButton.isSelected = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favouritesUpdated, object: nil)
    }
    
    func configUI() {
        cellView.layer.cornerRadius = 20
        cellImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cellImage.layer.cornerRadius = 25
        cellImage.clipsToBounds = true
        heartButton.addTarget(self, action: #selector(heartButtonTapped(_:)), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFavoritesUpdate), name: .favouritesUpdated, object: nil)
    }
    
    @objc func handleFavoritesUpdate(_ notification: Notification) {
        guard let deletedTripName = notification.object as? String else {return}
        if countryName.text == deletedTripName {
            heartButton.isSelected = false
            if let country = countryName.text {
                manager.setHeartButtonState(isSelected: false, countryName: country)
            }
        }
    }
    
    func configCell(travel: Travel) {
        countryName.text = travel.country
        cellLabel.text = travel.name
        cellImage.image = UIImage(named: travel.image.first ?? "")
        let isHeartSelected = manager.getHeartButtonState(for: travel.country ?? "")
        heartButton.isSelected = isHeartSelected
    }
    
    func isHeartButtonSelected() -> Bool {
        return heartButton.isSelected
    }
    
    @IBAction func heartButtonTapped(_ sender: Any) {
        heartButton.isSelected.toggle()
        if let country = countryName.text {
            manager.setHeartButtonState(isSelected: heartButton.isSelected, countryName: country)
        }
        heartButtonHandler?()
    }
}

extension Notification.Name {
    static let favouritesUpdated = Notification.Name("favoritesUpdated")
}
