//
//  Parameter.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//
import Foundation
import ObjectMapper


class Parameter : Mappable{
    
    var appId : [String]?
    var appKey : [String]?
    var query : [String]?
    var sane : [AnyObject]?
    
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        appId <- map["app_id"]
        appKey <- map["app_key"]
        query <- map["q"]
        sane <- map["sane"]
        
    }
}
