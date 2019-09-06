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
    
//    func loadFromCache() -> [ArticleList]{
//        var cachedArticles : [ArticleList]?
//        let objects = self.cache.getObjects(type: ArticleList.self)
//        if objects.count > 5 {
//            cachedArticles = Array(objects.prefix(5))
//        } else {
//            cachedArticles = objects
//        }
//        return cachedArticles ?? []
//    }
//    
}
