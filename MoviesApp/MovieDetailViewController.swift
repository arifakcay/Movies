//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imageViewImage: UIImageView!
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelMovieYear: UILabel!
    @IBOutlet weak var labelMovieCategory: UILabel!
    @IBOutlet weak var labelMovieDirector: UILabel!
    
    var movie:Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let m = movie {
            if let url = URL(string: "http://gerekli url buraya girilecek . \(m.movie_image!)"){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    
                    DispatchQueue.main.async {
                        self.imageViewImage.image = UIImage(data: data!)
                    }
                }
            }
            
            labelMovieName.text = m.movie_name
            labelMovieYear.text = m.movie_year
           // labelMovieCategory.text = m.categories?.category_id
           // labelMovieDirector.text = m.directors?.director_ad
        }
    }
}
