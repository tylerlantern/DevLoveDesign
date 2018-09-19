//
//  MapViewModel.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 4/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//
import UIKit
import MapKit
protocol MapViewModelDelegate : class {
    func didFinishLoadData(annotations : [StoreAnnotation])
}
class MapViewModel: NSObject {
    weak var delegate : MapViewModelDelegate!
    init(instance :  MapViewModelDelegate) {
        super.init()
        delegate = instance
    }
    func initilization()  {
        let annotations = buildTree(fileName: "Thai-Part")
        delegate.didFinishLoadData(annotations: annotations)
    }
    func buildTree(fileName : String) -> [StoreAnnotation]{
        let data : String
        guard let path = Bundle.main.path(forResource: fileName, ofType: "csv") else{
            print("cant load data");
            return []
        }
        data = try! String(contentsOfFile: path, encoding: String.Encoding.ascii)
        var line = data.components(separatedBy: "\n")
        let cline = line.count
        var annotations = [StoreAnnotation]()
        for i in 0...cline-1 {
            if let node =  dataFromLine(line: line[i]) {
                annotations.append(node)
            }
        }
        return annotations
    }
    func dataFromLine(line:String) -> StoreAnnotation? {
        if line == ""{
            return nil
        }
        let component = line.components(separatedBy: ",")
        let latitude =  (component[1] as NSString).doubleValue
        let longtitude = (component[0] as NSString).doubleValue
        let name = component[2]
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let annotation =  StoreAnnotation(coordinate: coordinate, name: name)

        return annotation
    }
}


