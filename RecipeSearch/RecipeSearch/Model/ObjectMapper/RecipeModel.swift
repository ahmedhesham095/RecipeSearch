//
//  RecipeModel.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import Foundation
import ObjectMapper


class RecipeModel :Mappable{
    
    var calories : Float?
    var cautions : [String]?
    var dietLabels : [String]?
    var healthLabels : [String]?
    var image : String?
    var ingredientLines : [String]?
    var ingredients : [Ingredient]?
    var label : String?
    var shareAs : String?
    var source : String?
    var totalWeight : Float?
    var uri : String?
    var url : String?
    var yield : Float?
    
    required init?(map: Map){}

    
    func mapping(map: Map)
    {
        calories <- map["calories"]
        cautions <- map["cautions"]
        dietLabels <- map["dietLabels"]
        healthLabels <- map["healthLabels"]
        image <- map["image"]
        ingredientLines <- map["ingredientLines"]
        ingredients <- map["ingredients"]
        label <- map["label"]
        shareAs <- map["shareAs"]
        source <- map["source"]
        totalWeight <- map["totalWeight"]
        uri <- map["uri"]
        url <- map["url"]
        yield <- map["yield"]
        
    }
}
