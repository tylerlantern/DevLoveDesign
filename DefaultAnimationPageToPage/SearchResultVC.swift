//
//  SearchResultVC.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 2/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var models : [CategoryModel] = {
        var m = [CategoryModel]()
        m.append(CategoryModel(name: "Toy"))
        m.append(CategoryModel(name: "Furniture"))
        m.append(CategoryModel(name: "Gag"))
        m.append(CategoryModel(name: "Cloth"))
        return m
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
extension SearchResultVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = models[indexPath.item].name
        return cell
    }
}

extension SearchResultVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
