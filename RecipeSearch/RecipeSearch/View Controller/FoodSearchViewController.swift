//
//  FoodSearchViewController.swift
//  RecipeSearch
//
//  Created by Ahmed Hesham on 7/26/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import UIKit
import SwiftPullToRefresh
import SwiftMessages

class FoodSearchViewController: UIViewController {
    
    lazy var utils :  ViewControllerUtils = {
        return ViewControllerUtils()
    }()
    lazy var presenter : SearchPresenter = {
        return SearchPresenter(withDelegate: self)
    }()
    let searchController = UISearchController(searchResultsController: nil)
    var searchResult : SearchResult?
    var searchSuggesstions : [RecipeList]?
    var itemsNumber = 10
    var isLoadMore = false
    var searchString : String?
    
    @IBOutlet weak var searchTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.delegate = self
        searchTable.dataSource = self
        searchTable.rowHeight = UITableView.automaticDimension
        searchTable.register(UINib(nibName: "SearchViewCell", bundle: nil), forCellReuseIdentifier: Constants.CELL_IDENTIFIER)
        setupLoadMore()
        setupSearchController()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.definesPresentationContext = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeSearchView()
    }
    /**
     show LoadMore
     */
    func setupLoadMore() {
        searchTable.spr_setIndicatorFooter {
            self.isLoadMore = true
            self.presenter.search(with: self.searchString ?? "" , itemNumber: self.itemsNumber + 10)
            self.itemsNumber += 10
        }
    }
    func setupSearchController() {
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchTable.tableHeaderView = searchController.searchBar
    }
}

extension FoodSearchViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let suggestions = searchSuggesstions?.count {
            if suggestions > 0 {
                return suggestions
            }
        }
        return searchResult?.hits?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: Constants.CELL_IDENTIFIER , for: indexPath) as! SearchViewCell
        if searchSuggesstions?.count ?? 0 > 0 {
            cell.configureCell(or: searchSuggesstions?[indexPath.row])
        }else {
            if  let recepie = searchResult?.hits?[indexPath.row].recipe {
                cell.configureCell(with: recepie)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        removeSearchView()
        let detailsVC = DetailsViewController()
        detailsVC.modalPresentationStyle = .overCurrentContext
        self.present(detailsVC , animated: true , completion: {
            if self.searchSuggesstions?.count ?? 0 > 0 {
                detailsVC.setDescriptonData(or: self.searchSuggesstions?[indexPath.row])
            } else {
                if  let recepie = self.searchResult?.hits?[indexPath.row].recipe {
                    detailsVC.setDescriptonData(with: recepie)
                }
            }
        })
    }
}

extension FoodSearchViewController : UISearchBarDelegate, UISearchDisplayDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchSuggesstions = presenter.getCachedData()
        self.searchTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSuggesstions?.removeAll()
        searchString = searchBar.text
        presenter.search(with: searchString ?? "", itemNumber: itemsNumber)
    }
    
    func removeSearchView() {
        if searchController.isActive == true {
            searchController.isActive = false
        }
    }
}

extension FoodSearchViewController : FoodProtocol {
    
    func configureUI(with result: SearchResult) {
        if isLoadMore == true {
            self.searchResult?.hits?.append(contentsOf: result.hits ?? [])
            self.isLoadMore = false
        } else {
            self.searchResult = result
        }
        self.searchTable.reloadData()
    }
    
    func showErrorMessage() {
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: .statusBar)
        let messageView = MessageView.viewFromNib(layout: .statusLine)
        messageView.configureTheme(.error, iconStyle: .default)
        messageView.configureDropShadow()
        messageView.configureContent(body: "Sorry .. Something went wrong")
        messageView.titleLabel?.isHidden = true
        messageView.button?.isHidden = true
        SwiftMessages.show(config: config, view: messageView)
    }
    
    func showLoader() {
        self.utils.showActivityIndicator(uiView: self.view)
    }
    
    func hideLoader() {
        self.utils.hideActivityIndicator(uiView: self.view)
    }
}
