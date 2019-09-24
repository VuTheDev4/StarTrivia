//
//  ViewController.swift
//  StarTrivia
//
//  Created by Vu Duong on 9/19/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starShipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    var personApi = PersonApi()
    var person : Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        
        let random = Int.random(in: 1 ... 87)
        
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person {
                self.setupView(person: person)
                self.person = person
            }
        }
        
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        
        homeworldBtn.isEnabled = !person.homeWorldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starShipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toHomeWorld" {
            if let destination = segue.destination as? HomeworldVC {
                destination.person = person
            }
        } else if segue.identifier == "toVehicles" {
            if let destination = segue.destination as? VehiclesVC {
                destination.person = person
            }
        } else  if segue.identifier == "toStarships" {
            if let destination = segue.destination as? StarshipsVC {
                destination.person = person
            }
        } else if segue.identifier == "toFilms" {
            if let destination = segue.destination as? FilmsVC {
                destination.person = person
            }
        }
        
    }
    
}

