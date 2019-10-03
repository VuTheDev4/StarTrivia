//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Vu Duong on 9/24/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    
    @IBOutlet weak var crawLbl: UITextView!
    
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person : Person!
    let api = FilmsApi()
    var films = [String]()
    var currentFilm = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstfilm = films.first else {return}
        getFilm(url: firstfilm)
        
       
    }
    
    func getFilm(url: String) {
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releaseLbl.text = film.releaseDate
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawLbl.text = stripped.replacingOccurrences(of: "\r", with: " ")
        
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        
        currentFilm -= 1
        setButtonState()
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        
        getFilm(url: films[currentFilm])
        
    }
    
}
