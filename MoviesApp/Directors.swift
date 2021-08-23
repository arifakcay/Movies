//
//  Directors.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import Foundation
class Directors:Codable {
    var director_id:String?
    var director_ad:String?
    
    init() {
        
    }
    
    init(director_id:String,director_ad:String) {
        self.director_id = director_id
        self.director_ad = director_ad
    }
}
