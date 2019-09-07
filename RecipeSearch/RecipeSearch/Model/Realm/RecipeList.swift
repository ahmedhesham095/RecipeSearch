//
//  ArticleList.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 8/12/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import Foundation
import RealmSwift

class RecipeList: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var imageURL: String = ""
    let healthLabels = List<String>()
    let ingredientLines = List<String>()
    @objc dynamic var source: String = ""
    @objc dynamic var url : String = ""
    
    class func convertToRealmModel(with hits : [Hit]) -> [RecipeList] {
        var recipesList = [RecipeList]()
        hits.forEach { (hit) in
            let recipeData = RecipeList()
            recipeData.title = hit.recipe?.label ?? ""
            recipeData.imageURL = hit.recipe?.image ?? ""
            recipeData.url = hit.recipe?.url ?? ""
            hit.recipe?.healthLabels?.forEach({ (label) in
                recipeData.healthLabels.append(label)
            })
            hit.recipe?.ingredientLines?.forEach({ (line) in
                recipeData.ingredientLines.append(line)
            })
            recipeData.source = hit.recipe?.source ?? ""
            recipesList.append(recipeData)
        }
        return recipesList
    }
}
