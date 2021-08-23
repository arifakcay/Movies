//
//  MoviesCollectionViewCell.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import UIKit

protocol MovieCollectionViewCellProtocol {
    func addBasket(indexPath:IndexPath)
}

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelMoviePrize: UILabel!
  
    var cellProtocol:MovieCollectionViewCellProtocol?
    var indexPath:IndexPath?
    
    @IBAction func buttonAddBasket(_ sender: Any) {
        cellProtocol?.addBasket(indexPath: indexPath!)
    }
}
