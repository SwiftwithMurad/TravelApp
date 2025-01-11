//
//  CategoryCell.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet private weak var countryName: UILabel!
    @IBOutlet private weak var cellLabel: UILabel!
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }

    func configUI() {
        cellView.layer.cornerRadius = 20
        cellImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cellImage.layer.cornerRadius = 25
        cellImage.clipsToBounds = true
    }
    
    func configCell(travel: Travel) {
        countryName.text = travel.country
        cellLabel.text = travel.name
        cellImage.image = UIImage(named: travel.image.first ?? "")
    }
    
    @IBAction func heartButtonTapped(_ sender: Any) {
        heartButton.isEnabled = true
        heartButton.tintColor = .home
    }
}
