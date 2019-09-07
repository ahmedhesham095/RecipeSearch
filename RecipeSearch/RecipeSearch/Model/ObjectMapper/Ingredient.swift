//
//  Ingredient.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//
import Foundation
import ObjectMapper


class Ingredient : Mappable{
    
    var food : String?
    var measure : String?
    var quantity : Float?
    var text : String?
    var weight : Float?
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        food <- map["food"]
        measure <- map["measure"]
        quantity <- map["quantity"]
        text <- map["text"]
        weight <- map["weight"]
    }
}
