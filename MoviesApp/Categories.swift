//
//  Categories.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import Foundation
class Categories:Codable {
    var category_id:String?
    var category_ad:String?
    
    init() {
        
    }
    
    init(category_id:String,category_ad:String) {
        self.category_id = category_id
        self.category_ad = category_ad
    }
}
