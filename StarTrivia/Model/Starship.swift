//
//  Starship.swift
//  StarTrivia
//
//  Created by Vu Duong on 10/1/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import Foundation


struct Starship : Codable {
    let name: String
    let model: String
    let maker: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let cargo: String
    let passengers: String
    let consumables: String
    let starShipClass: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case maker = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargo = "cargo_capacity"
        case consumables
        case starShipClass = "starship_class"
    }
    
}
