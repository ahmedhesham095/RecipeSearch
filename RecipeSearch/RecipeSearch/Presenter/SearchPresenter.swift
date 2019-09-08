//
//  HomePresenter.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import Foundation

class SearchPresenter: NSObject {
    
    var foodDelegate : FoodProtocol?
    
    init(withDelegate foodDelegate: FoodProtocol) {
        self.foodDelegate = foodDelegate
    }
    /**
     calls the network manager for searching for food
     parameter query: search query
     parameter item number: number of items returning in the response
     */
    func search(with query: String , itemNumber : Int){
        foodDelegate?.showLoader()
        APIManager.apiSharredInistance.searchFood(with: query, and: itemNumber - Constants.ITEMS_OFFSET, and: itemNumber) {
            (isSuccessful, searchResult) in
            self.foodDelegate?.hideLoader()
            if isSuccessful {
                if let result = searchResult {
                self.foodDelegate?.configureUI(with: result)
                }
            } else {
                self.foodDelegate?.showErrorMessage()
            }
        }
    }
    /*
    calls the network manager to return the cached search list
    */
    func getCachedData() -> [RecipeList] {
       return APIManager.apiSharredInistance.loadFromCache()
    }
}
