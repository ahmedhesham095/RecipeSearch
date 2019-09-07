//
//  APIManager.swift
//  RecipeSearch
//
//  Created by Vodafone on 8/6/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import Foundation
import Moya

class APIManager {
    
    private init(){}
    
    static let apiSharredInistance = APIManager()
    
    typealias searchCompletion = ((Bool , SearchResult?) -> Void)
    
    var cache = CacheHandler()
    
    lazy var apiProvider: MoyaProvider<APIService> = {
        return MoyaProvider<APIService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }()
    
    func searchFood(with query : String , and from : Int , and to : Int ,completion: @escaping searchCompletion){
        apiProvider.request(.searchForFood(fromIndex: from, toIndex: to, query: query) , completion:{ result in
            switch result {
            case let .success(response):
                do {
                    print("response success")
                    let loadedData = try response.mapObject(SearchResult.self)
                    self.cache.setArray(with: RecipeList.convertToRealmModel(with: loadedData.hits ?? []))
                    completion(true , loadedData)
                }
                catch {
                    // Server Error
                    print("Request is not succesfull From Server ")
                    completion(false , nil)
                }
            case let .failure(error):
                // Network Error
                print(error.errorDescription ?? "Unknown error description")
                completion(false , nil)
            }
        })
    }
    
    func loadFromCache() -> [RecipeList]{
        var cachedRecipes : [RecipeList]?
        let objects = self.cache.getObjects(type: RecipeList.self)
        if objects.count > 10 {
            cachedRecipes = Array(objects.prefix(10))
        } else {
            cachedRecipes = objects
        }
        return cachedRecipes ?? []
    }
}
