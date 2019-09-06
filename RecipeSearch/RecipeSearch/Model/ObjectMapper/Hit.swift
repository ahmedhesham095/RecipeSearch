//
//  Hit.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import Foundation
import ObjectMapper


class Hit : Mappable{
    
    var bookmarked : Bool?
    var bought : Bool?
    var recipe : RecipeModel?
    
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        bookmarked <- map["bookmarked"]
        bought <- map["bought"]
        recipe <- map["recipe"]
    }
    
}
