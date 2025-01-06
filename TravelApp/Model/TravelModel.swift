//
//  TravelModel.swift
//  TravelApp
//
//  Created by Mac on 04.01.25.
//

import Foundation

struct Categories: Codable {
    let id: Int?
    let name: String?
    let image: String?
    var isSelected: Bool?
}

struct Travel: Codable {
    let id: Int?
    let name: String?
    let country: String?
    let image: String?
}
