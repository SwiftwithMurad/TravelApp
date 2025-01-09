//
//  TableHeaderCell.swift
//  TravelApp
//
//  Created by Mac on 09.01.25.
//

import UIKit

class TableHeaderCell: UICollectionViewCell {
    let header = TableHeaderView()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        return image
    }()
    
//    lazy var imageView2: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.clipsToBounds = true
//        image.image = UIImage(named: "moraineLake")
//        return image
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
