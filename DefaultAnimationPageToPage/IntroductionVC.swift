//
//  IntroductionVC.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 7/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit

class IntroductionVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var models : [IntroductItemModel] = {
        var m = [IntroductItemModel]()
        m.append(IntroductItemModel(title: "Page To Page Navigation", segueIdentifier: "seguePTPNav") )
         m.append(IntroductItemModel(title: "Search Animation", segueIdentifier: "segueSearch") )
        m.append(IntroductItemModel(title: "MapView Cluster", segueIdentifier: "segueMapViewCluster") )
        return m
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension IntroductionVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IntroductionCell", for: indexPath)
        let item = models[indexPath.item]
        cell.textLabel?.text = item.title
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: models[indexPath.item].segueIdentifier, sender: nil)
    }
}
extension IntroductionVC : UITableViewDelegate {
    
}

class IntroductItemModel  {
    var title : String!
    var segueIdentifier : String!
    
    init(title : String , segueIdentifier : String) {
        self.title = title
        self.segueIdentifier = segueIdentifier
    }
    
}


