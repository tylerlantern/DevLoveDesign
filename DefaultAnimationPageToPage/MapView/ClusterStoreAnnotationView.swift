//
//  ClusterStoreAnnotationView.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 4/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit
import MapKit
class ClusterStoreAnnotationView: MKMarkerAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        displayPriority = .defaultHigh
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var annotation: MKAnnotation? {
        willSet {
            if let cluster = newValue as? MKClusterAnnotation {
                markerTintColor = UIColor.blue
                glyphText = "\(cluster.memberAnnotations.count)"
            }
        }
}
}
