//
//  NewsViewCell.swift
//  News
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func  configureCell(with model : RecipeModel)  {
        var healthText : String?
        searchImageView.image = UIImage(named: "placeholder.jpg")
        searchImageView.moa.url = model.image
        searchTtileLabel.text = model.label
        searchSouceLabel.text = model.source
        model.healthLabels?.forEach({ (healthLabel) in
            healthText = "\(healthText ?? "")\n\(healthLabel)"
        })
        searchHealthLabel.text = healthText
    }
    
    
    
    //    func configure(with article : Article? = nil , or cachedArticle : ArticleList? = nil) {
    //        guard let article = article else {
    //            newsHeadlineImageView.image = UIImage(named: "placeholder.jpg")
    //            newsHeadlineImageView.moa.url = cachedArticle?.urlToImage
    //            newsTtileLabel.text = cachedArticle?.title
    //            newsAuthorLabel.text = cachedArticle?.author
    //            newsDescriptionLabel.text = cachedArticle?.descriptionField
    //            return
    //        }
    //        newsHeadlineImageView.moa.url = article.urlToImage
    //        newsTtileLabel.text = article.title
    //        newsAuthorLabel.text = article.author
    //        newsDescriptionLabel.text = article.descriptionField
    //    }
    
}
