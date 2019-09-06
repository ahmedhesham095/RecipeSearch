//
//  APIService.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import Foundation
import Moya

enum APIService {
    case searchForFood(fromIndex:Int , toIndex: Int , query: String)
}

extension APIService :TargetType{
    //Request Headers
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
    //Base URL
    var baseURL: URL {
        return URL(string: Constants.BASE_URL)!
    }
    // Endpoint URL
    var path: String {
        switch self {
        case .searchForFood:
            return Constants.SEARCH
        }
    }
    // Request type
    var method: Moya.Method {
        switch self {
        case .searchForFood:
            return .get
        }
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        
        switch self {
        //Request Parameters
        case .searchForFood(let fromIndex , let toIndex , let query):
            return .requestParameters(parameters: ["app_id": Constants.APP_ID , "q": query ,  "app_key": Constants.API_KEY,  "from" : fromIndex , "to" : toIndex , ] , encoding: URLEncoding.default)
        }
    }
}
