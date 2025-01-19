//
//  FavouritesCell.swift
//  TravelApp
//
//  Created by Mac on 13.01.25.
//

import UIKit

class FavouritesCell: UITableViewCell {
    
    @IBOutlet private weak var favouriteCountry: UILabel!
    @IBOutlet private weak var favouriteName: UILabel!
    @IBOutlet private weak var favouriteImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configUI() {
        favouriteImage.layer.cornerRadius = 20
    }
    
    func configCell(travel: TravelList) {
        favouriteCountry.text = travel.countryName
        favouriteName.text = travel.tripName
        favouriteImage.image = UIImage(named: travel.image ?? "")
    }
}
