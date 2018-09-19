//
//  SearchDemo1VC.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 2/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit
class SearchDemo1VC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var models1 : [CategoryModel] = {
        var m = [CategoryModel]()
        m.append(CategoryModel(name: "Toy"))
        m.append(CategoryModel(name: "Furniture"))
        m.append(CategoryModel(name: "Gag"))
        m.append(CategoryModel(name: "Cloth"))
        m.append(CategoryModel(name: "Show"))
        m.append(CategoryModel(name: "Game"))
        m.append(CategoryModel(name: "Bag"))
        return m
    }()
    
    lazy var models2 : [CategoryModel] = {
        var m = [CategoryModel]()
        m.append(CategoryModel(name: "Toy"))
        m.append(CategoryModel(name: "Furniture"))
        m.append(CategoryModel(name: "Gag"))
        m.append(CategoryModel(name: "Cloth"))
        m.append(CategoryModel(name: "Show"))
        m.append(CategoryModel(name: "Game"))
        m.append(CategoryModel(name: "Bag"))
        return m
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        initilizationSearchVc()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func packagedSearchController0() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let searchResultsController = storyboard.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC else {
            fatalError("Unable to instatiate a SearchResultsViewController from the storyboard.")
        }
        
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = searchResultsController
        searchController.searchBar.placeholder = "Enter keyword"
//        searchController.searchBar.searchBarStyle = .minimal
        let searchContainer = UISearchContainerViewController(searchController: searchController)
        searchContainer.title = NSLocalizedString("Search", comment: "")
        
        let searchNavigationController = UINavigationController(rootViewController: searchContainer)
        return searchNavigationController
    }
    var searchController : UISearchController!
    func initilizationSearchVc()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let searchResultsController = storyboard.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC else {
            fatalError("Unable to instatiate a SearchResultsViewController from the storyboard.")
        }
        searchController = UISearchController(searchResultsController: searchResultsController)
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.barTintColor = UIColor.white
         self.searchController.searchBar.searchBarStyle = UISearchBarStyle.minimal
        self.searchController.searchBar.setMagnifyingGlassColorTo(color: UIColor.lightGray)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.definesPresentationContext = true
    }
}
extension SearchDemo1VC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
extension SearchDemo1VC : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? models1.count : models2.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        if indexPath.section == 0 {
             cell.textLabel?.text = models1[indexPath.item].name
        }else {
            cell.textLabel?.text = models2[indexPath.item].name
        }
       return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Category1" : "Category2"
    }
}
extension SearchDemo1VC : UITableViewDelegate{
    
}

