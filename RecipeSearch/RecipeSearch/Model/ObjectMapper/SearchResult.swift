//
//  SearchResult.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//
import Foundation
import ObjectMapper


class SearchResult : Mappable{
    var count : Int?
    var from : Int?
    var hits : [Hit]?
    var more : Bool?
    var params : Parameter?
    var query : String?
    var to : Int?
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        count <- map["count"]
        from <- map["from"]
        hits <- map["hits"]
        more <- map["more"]
        params <- map["params"]
        query <- map["q"]
        to <- map["to"]
    }
}
