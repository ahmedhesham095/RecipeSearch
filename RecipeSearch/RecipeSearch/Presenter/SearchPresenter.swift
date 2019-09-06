//
//  HomePresenter.swift
//  News
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import UIKit
import Moya_ObjectMapper
import Moya
import ObjectMapper
import RealmSwift

class SearchPresenter: NSObject {
    
    var foodDelegate : FoodProtocol?
    
    init(withDelegate foodDelegate: FoodProtocol) {
        self.foodDelegate = foodDelegate
    }
    /**
     calls the network manager for loading news
     parameter countryCode: Describe the country code
     parameter pageOffset: Describe the offset in the API
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
}
