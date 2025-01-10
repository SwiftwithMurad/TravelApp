//
//  InfoController.swift
//  TravelApp
//
//  Created by Mac on 06.01.25.
//

import UIKit

class InfoController: UIViewController {
    var travel: Travel?
    let viewModel = InfoViewModel()
    
    @IBOutlet private weak var infoTable: UITableView!
    @IBOutlet private weak var heartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configHeader()
    }
    
    func configUI() {
        infoTable.dataSource = self
        infoTable.delegate = self
        infoTable.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        infoTable.separatorStyle = .none
        infoTable.allowsSelection = false
    }
    
    func configHeader() {        
        let headerView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 400))
        headerView.travel = travel
        infoTable.tableHeaderView = headerView
    }
    
    @IBAction func heartButtonTapped(_ sender: Any) {
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
