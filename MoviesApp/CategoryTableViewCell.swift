//
//  CategoryTableViewCell.swift
//  MoviesApp
//
//  Created by admin on 22.08.2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCategoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
