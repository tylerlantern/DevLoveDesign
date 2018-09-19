//
//  StoreNode.swift
//  SCGMapView
//
//  Created by Nattapong Unaregul on 27/3/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit

struct StoreNode  {
    var x: Double
    var y: Double
    var name : String = ""
//    var phoneNumber : String = ""
//    var thumbnailURL : String = ""
    init(latitude : Double , longitude : Double  ) {
        x = latitude
        y = longitude
    }
}
