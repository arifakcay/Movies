//
//  MovieViewController.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import UIKit
import Alamofire

class MovieViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var moviesList = [Movies]()
    var category:Categories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
        // CollectionCell'i tasarlıyoruz.
        
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.movieCollectionView.frame.size.width
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let cellWidth = (width-30)/2
        
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.7)
        design.minimumLineSpacing = 10
        design.minimumInteritemSpacing = 10
        
        movieCollectionView.collectionViewLayout = design
        
        if let c = category {
            if let cid = Int(c.category_id!){ // category_id içerisi nil olduğu için convert işlemini yapamıyor .
                navigationItem.title = c.category_ad
                moviesCategoryId(category_id:"\(cid)")
                // yukarıdan gelen category nesnemin içi nil olduğu için dönüşüm yapamadım.  Veri çekebileceğim gerçek bir web servis bulursam bu hatayı almam.
        }
    }
    
    func moviesCategoryId(category_id:String){
        let parameters:Parameters = ["category_id":category_id]
        
        Alamofire.request("http://gerekli url buraya girilecek", method: .post,parameters: parameters).responseJSON{
            response in
            if let data = response.data {
                do{
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                    if let comingMoviesList = response.movies {
                        self.moviesList = comingMoviesList
                    }
                    
                    DispatchQueue.main.async {
                        self.movieCollectionView.reloadData()
                    }
                    
                }catch{
                    print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let destinationVC = segue.destination as! MovieDetailViewController
        destinationVC.movie = moviesList[indeks!]
    }
}

extension MovieViewController:UICollectionViewDataSource,UICollectionViewDelegate,MovieCollectionViewCellProtocol {
    
    func addBasket(indexPath: IndexPath) {
        print("Sepete Eklenen Film : \(moviesList[indexPath.row].movie_name!)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let comingMovies = moviesList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
        
        cell.labelMovieName.text = comingMovies.movie_name
        cell.labelMoviePrize.text = "14.99"
        
        if let url = URL(string: "http://gerekli url buraya girilecek . \(comingMovies.movie_image!)"){
            
                DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    cell.imageViewMovie.image = UIImage(data: data!)
                }
            }
        }
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
        }
    }

