//
//  NewsViewCell.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import UIKit
import moa

class SearchViewCell: UITableViewCell {
    
    @IBOutlet weak var searchImageView: UIImageView!
    
    @IBOutlet weak var searchTtileLabel: UILabel!
    
    @IBOutlet weak var searchSouceLabel: UILabel!
    
    @IBOutlet weak var searchHealthLabel: UILabel!
    
    func  configureCell(with model : RecipeModel? = nil , or cachedModel : RecipeList? = nil)  {
        var healthText : String?
        guard let model = model else {
            searchImageView.image = UIImage(named: "placeholder.jpg")
            searchImageView.moa.url = cachedModel?.imageURL
            searchTtileLabel.text = cachedModel?.title
            searchSouceLabel.text = cachedModel?.source
            cachedModel?.healthLabels.forEach({ (healthLabel) in
                healthText = "\(healthText ?? "")\n\(healthLabel)"
            })
            searchHealthLabel.text = healthText
            return
        }
        searchImageView.image = UIImage(named: "placeholder.jpg")
        searchImageView.moa.url = model.image
        searchTtileLabel.text = model.label
        searchSouceLabel.text = model.source
        model.healthLabels?.forEach({ (healthLabel) in
            healthText = "\(healthText ?? "")\n\(healthLabel)"
        })
        searchHealthLabel.text = healthText
    }
}
