//
//  StarshipApi.swift
//  StarTrivia
//
//  Created by Vu Duong on 10/1/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import Foundation
import Alamofire

class StarshipApi {
    
    func getStarship(url: String, completion: @escaping StarshipResponseCompletion) {
        
        guard let url = URL(string: url) else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    
                    let starship = try jsonDecoder.decode(Starship.self, from: data)
                    completion(starship)
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(nil)
            }
        }
    }
}
