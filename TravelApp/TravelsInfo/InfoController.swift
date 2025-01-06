//
//  InfoController.swift
//  TravelApp
//
//  Created by Mac on 06.01.25.
//

import UIKit

class InfoController: UIViewController {

    @IBOutlet weak var heartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func heartButtonTapped(_ sender: Any) {
        heartButton.backgroundColor = .home
    }
}
