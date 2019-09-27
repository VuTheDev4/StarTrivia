//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Vu Duong on 9/24/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var person: Person!
    let api = HomeworldApi()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.getHomeworld(url: person.homeWorldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupUI(homeworld: homeworld)
            }
        }
    }
    
    func setupUI(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
    
}
