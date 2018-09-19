//
//  SearchDemo2VC.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 2/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit

class SearchDemo2VC: UIViewController {
    @IBAction func action_goBack(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initilizationSearchVc()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var searchController : UISearchController!
    func initilizationSearchVc()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let searchResultsController = storyboard.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC else {
            fatalError("Unable to instatiate a SearchResultsViewController from the storyboard.")
        }
        searchController = UISearchController(searchResultsController: searchResultsController)
        self.searchController.searchResultsUpdater = searchResultsController
        self.searchController.searchBar.barTintColor = UIColor.white
        self.searchController.searchBar.searchBarStyle = UISearchBarStyle.minimal
        
        self.searchController.searchBar.setMagnifyingGlassColorTo(color: UIColor.lightGray)
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = true
    
        self.navigationItem.titleView = self.searchController.searchBar
        self.definesPresentationContext = true
    }
}

