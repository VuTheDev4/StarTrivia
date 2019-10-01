//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Vu Duong on 9/24/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var cargoCapLbl: UILabel!
    @IBOutlet weak var consumablesLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    
    
    var person : Person!
    let api = StarshipApi()
    var starships = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        starships = person.starshipUrls
        guard let firststarship = starships.first else { return }
        getStarship(url: firststarship)
        
    }
    
    func getStarship(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.maker
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
        cargoCapLbl.text = starship.cargo
        consumablesLbl.text = starship.consumables
        classLbl.text = starship.starShipClass
        
    }

}
