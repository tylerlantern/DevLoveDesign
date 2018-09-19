//
//  ClusterAnnotation.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 4/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit
import MapKit
class StoreAnnotation: NSObject , MKAnnotation{
    
    var name : String = ""
    
    var _coordinate : CLLocationCoordinate2D!
    var coordinate: CLLocationCoordinate2D {
        get{
            return _coordinate
        }set{
            _coordinate = newValue
        }
    }
    init(coordinate : CLLocationCoordinate2D , name : String) {
        super.init()
        self.name = name
        self._coordinate = coordinate
    }
}
