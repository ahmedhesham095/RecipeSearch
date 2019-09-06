//
//  DetailsViewController.swift
//  News
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import UIKit
import moa
import SafariServices

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var receipeImage: UIImageView!
    
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeButton: UIButton!
    
    @IBOutlet weak var recipeIngredients: UILabel!
    var receipeURL : String?
    var recipeIngredient : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setDescriptonData(with recepie :RecipeModel)  {
        receipeImage.image = UIImage(named: "placeholder.jpg")
        receipeImage.moa.url = recepie.image
        recipeTitle.text = recepie.label
        receipeURL = recepie.url
        recipeButton.titleLabel?.text = receipeURL
        recepie.ingredientLines?.forEach({ (line) in
            recipeIngredient = "\(recipeIngredient ?? "")\n\(recipeIngredient ?? "")"
        })
        recipeIngredients.text = recipeIngredient
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func recipeAction(_ sender: Any) {
        if let recipeUrl = URL(string: receipeURL ?? "") {
            let safariVC = SFSafariViewController(url: recipeUrl)
         //   self.dismiss(animated: true) {
                self.present(safariVC, animated: true, completion: nil)
          //  }
            
        }
    }
    
    
}
