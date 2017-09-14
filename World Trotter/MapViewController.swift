//
//  MapViewController.swift
//  World Trotter
//
//  Created by Marco Aguilar on 9/11/17.
//  Copyright © 2017 Brown Space Mango. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as "the" view of this view controller
        view = mapView
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
}
