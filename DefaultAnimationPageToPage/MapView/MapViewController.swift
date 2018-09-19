//
//  MapViewController.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 4/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    @IBOutlet weak var mapview: MKMapView!
    lazy var viewModel = MapViewModel(instance: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapview.register(StoreAnnotationView.self.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapview.register(ClusterStoreAnnotationView.self.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        let initialLocation = CLLocation(latitude:13.7455921335891 , longitude: 100.527416061043)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.2)
        let coordinateRegion = MKCoordinateRegionMake(initialLocation.coordinate, span)
        mapview.setRegion(coordinateRegion, animated: false)
        viewModel.initilization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension MapViewController : MapViewModelDelegate {
    func didFinishLoadData(annotations: [StoreAnnotation]) {
        mapview.addAnnotations(annotations)
    }
}

