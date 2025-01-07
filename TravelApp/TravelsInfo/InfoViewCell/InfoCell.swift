//
//  InfoCell.swift
//  TravelApp
//
//  Created by Mac on 07.01.25.
//

import UIKit

class InfoCell: UITableViewCell {
    
    @IBOutlet private weak var tripInfo: UILabel!
    @IBOutlet private weak var countryName: UILabel!
    @IBOutlet private weak var tripName: UILabel!
    @IBOutlet private weak var infoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func configCell(travel: TravelInfo) {
        countryName.text = travel.country
        tripName.text = travel.name
        tripInfo.text = travel.info
        infoImage.image = UIImage(named: travel.image ?? "")
    }
}
