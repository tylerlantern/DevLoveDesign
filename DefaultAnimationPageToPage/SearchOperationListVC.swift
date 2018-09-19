//
//  SearchOperationListVC.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 8/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit


class SearchOperationModel {
    var title : String
    var segueIdentifier : String!
    
    init(title : String , segueIdentifier : String) {
        self.title = title
        self.segueIdentifier = segueIdentifier
    }
}

class SearchOperationListVC: UITableViewController {
    lazy var models : [SearchOperationModel] = {
        var m = [SearchOperationModel]()
        m.append(SearchOperationModel(title: "Search 1", segueIdentifier: "segueDemo1") )
        m.append(SearchOperationModel(title: "Search 2", segueIdentifier: "segueDemo2") )
        m.append(SearchOperationModel(title: "Search 3", segueIdentifier: "segueDemo3") )
        return m
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchOperationCell", for: indexPath)
        cell.textLabel?.text = models[indexPath.item].title
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: models[indexPath.item].segueIdentifier, sender: nil)
    }
}
