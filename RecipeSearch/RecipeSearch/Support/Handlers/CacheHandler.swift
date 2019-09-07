//
//  CacheHandler.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class CacheHandler {
    
    lazy var realm:Realm = {
        return try! Realm()
    }()
    
    /**
     Save array of objects to database
     */
    func setArray(with array :[RecipeList])  {
        if getObjects(type: RecipeList.self).isEmpty == false {
            try! realm.write {
                realm.deleteAll()
            }
        }
        do {
            try realm.write({
                realm.add(array)
            })
        }
        catch {
            print("Error in Saving Object")
        }
    }
    
    /**
     Returs an array of Recipes
     */
    func getObjects(type: RecipeList.Type) -> [RecipeList] {
        let objects = realm.objects(RecipeList.self).toArray(ofType: RecipeList.self) as [RecipeList]
        return objects
    }
    
}
