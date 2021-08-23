//
//  Movies.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import Foundation
class Movies:Codable {
    var movie_id:String?
    var movie_name:String?
    var movie_year:String?
    var movie_image:String?
    var categories:[Categories]?
    var directors:[Directors]?
    
    init() {
        
    }
    
    init(categories:[Categories],directors:[Directors],movie_id:String,movie_name:String,movie_year:String,movie_image:String) {
        self.categories = categories
        self.directors = directors
        self.movie_id = movie_id
        self.movie_name = movie_name
        self.movie_year = movie_year
        self.movie_image = movie_image
    }
}
