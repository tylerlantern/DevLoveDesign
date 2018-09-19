//
//  StoreAnnotationView.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 4/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit
import MapKit
class StoreAnnotationView: MKMarkerAnnotationView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override var annotation: MKAnnotation? {
        willSet {
            if let store = newValue as? StoreAnnotation {
                // The default value of this property is nil
                // Setting the property to a non nil value it to participate in clustering.
                clusteringIdentifier = "store"
                displayPriority = .required
            }
        }
    }
}
