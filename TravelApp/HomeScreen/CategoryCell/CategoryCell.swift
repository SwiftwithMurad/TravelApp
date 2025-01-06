//
//  CategoryCell.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }

    func configUI() {
        cellView.layer.cornerRadius = 20
        cellImage.layer.cornerRadius = 30
        cellImage.clipsToBounds = true
    }
    
    func configCell(travel: Travel) {
        countryName.text = travel.country
        cellLabel.text = travel.name
        cellImage.image = UIImage(named: travel.image ?? "")
    }
}
