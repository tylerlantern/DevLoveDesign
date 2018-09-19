//
//  SearchResultWithSearchBarVC.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 4/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.


import UIKit

class SearchResultWithSearchBarVC: UIViewController {
    lazy var searchController :  UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.hidesNavigationBarDuringPresentation = false
        sc.searchBar.searchBarStyle = .minimal
        sc.searchBar.setSerchTextcolor(color: UIColor.white)
        sc.searchBar.setMagnifyingGlassColorTo(color: UIColor.white)
        sc.searchBar.setPlaceholderTextColorTo(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5) )
        sc.searchBar.backgroundColor = UIColor.clear
        sc.dimsBackgroundDuringPresentation = false
        self.definesPresentationContext = false
        self.navigationItem.titleView =  sc.searchBar
        sc.navigationItem.titleView?.isHidden = true
        return sc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
        self.navigationItem.hidesBackButton = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension SearchResultWithSearchBarVC : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SearchResultWithSearchBarVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
extension SearchResultWithSearchBarVC : UISearchControllerDelegate {
    
}
