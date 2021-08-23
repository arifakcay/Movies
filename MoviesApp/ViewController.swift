//
//  ViewController.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    var categoriesList = [Categories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        allCategoryGet()
    }
    
    func allCategoryGet(){
        Alamofire.request("http://gerekli url buraya girilecek", method: .get).responseJSON{
            response in
            if let data = response.data {
                do{
                let response = try JSONDecoder().decode(CategoryResponse.self, from: data)
                    if let comingCategoryList = response.categories {
                        self.categoriesList = comingCategoryList
                    }
                    
                    DispatchQueue.main.async {
                        self.categoryTableView.reloadData()
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let destinationVC = segue.destination as! MovieViewController
        destinationVC.category = categoriesList[indeks!]
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comingCategory = categoriesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.labelCategoryName.text = comingCategory.category_ad
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toMovies", sender: indexPath.row)
    }
}

// Arif AKÇAY
// 0536 272 9675
