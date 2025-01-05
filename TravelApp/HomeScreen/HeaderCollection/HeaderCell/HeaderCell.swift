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
        layer.cornerRadius = 22.5
    }
    
    func configCell(category: Categories) {
        cellLabel.text = category.name
        cellImage.image = UIImage(named: category.image ?? "")
    }
    
    func updateView() {
        cellView.backgroundColor = UIColor(named: "HomeColor")
        cellView.layer.cornerRadius = 18
    }
}
