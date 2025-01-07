//
//  InfoController.swift
//  TravelApp
//
//  Created by Mac on 06.01.25.
//

import UIKit

class InfoController: UIViewController {
    var travel: Travel?
    
    @IBOutlet private weak var infoTable: UITableView!
    @IBOutlet private weak var heartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        infoTable.dataSource = self
        infoTable.delegate = self
        infoTable.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        infoTable.separatorStyle = .none
        infoTable.allowsSelection = false
    }

    @IBAction func heartButtonTapped(_ sender: Any) {
        heartButton.backgroundColor = .home
    }
}

extension InfoController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
        if let travel = travel {
            cell.configCell(travel: travel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
