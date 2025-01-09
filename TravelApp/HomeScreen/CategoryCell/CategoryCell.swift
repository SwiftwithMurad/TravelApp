//
//  CategoryCell.swift
//  TravelApp
//
//  Created by Mac on 05.01.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet private weak var countryName: UILabel!
    @IBOutlet private weak var cellLabel: UILabel!
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    func roundTopCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    func configUI() {
        cellView.layer.cornerRadius = 20
        cellImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cellImage.layer.cornerRadius = 25
        cellImage.clipsToBounds = true
    }
    
    func configCell(travel: Travel, index: Int) {
        countryName.text = travel.country
        cellLabel.text = travel.name
        cellImage.image = UIImage(named: travel.image.first ?? "")
    }
}
