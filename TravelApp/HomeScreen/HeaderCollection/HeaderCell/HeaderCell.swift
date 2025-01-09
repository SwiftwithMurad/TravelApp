//
//  HeaderCell.swift
//  TravelApp
//
//  Created by Mac on 04.01.25.
//

import UIKit

class HeaderCell: UICollectionViewCell {

    @IBOutlet private weak var cellLabel: UILabel!
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }

    func configUI() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        cellImage.tintColor = .home
    }
    
    func configCell(category: Categories) {
        cellLabel.text = category.name
        cellImage.image = UIImage(named: category.image ?? "")?.withRenderingMode(.alwaysTemplate)
    }
    
    func updateView(isSelected: Bool) {
        cellView.backgroundColor = isSelected ? .home: .white
        cellView.layer.cornerRadius = isSelected ? 20: 0
        cellImage.tintColor = isSelected ? .white: .home
        layer.borderColor = isSelected ? UIColor.home.cgColor: UIColor.white.cgColor
    }
}
