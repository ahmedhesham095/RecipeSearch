//
//  DetailsViewController.swift
//  RecipeSearch
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
    
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var recipeIngredients: UILabel!
    var receipeURL : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailsViewController.openSafariVC))
       urlLabel.addGestureRecognizer(tap)
        urlLabel.isUserInteractionEnabled = true
    }
    
    func setDescriptonData(with recepie :RecipeModel)  {
        receipeImage.image = UIImage(named: "placeholder.jpg")
        receipeImage.moa.url = recepie.image
        recipeTitle.text = recepie.label
        receipeURL = recepie.url
        urlLabel.text = receipeURL
        recipeIngredients.text = recepie.ingredientLines?.joined(separator: "\n")
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
   @objc func openSafariVC(sender:UITapGestureRecognizer) {
        if let recipeUrl = URL(string: receipeURL ?? "") {
            let safariVC = SFSafariViewController(url: recipeUrl)
            self.present(safariVC, animated: true, completion: nil)
        }
    }
    
    
}
