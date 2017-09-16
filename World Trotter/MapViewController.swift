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
    
    // loadView() is overrriden to create a view controller's view programmatically.
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as "the" view of this view controller
        view = mapView
        
        //UISegmentedControl allows the user to choose between a discrete set of options
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        
        //autoresizing masks allows views to scale to different sizes. The fix to is setting the property to "false" in order to work with explicit constraints.
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        //Anchoring the constraints
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        //the constraints need to be activated for them to work on the app
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
    }
    
    
    
    // viewdidLoad() is overriden to configure views created by loading an interface file. This method gets called fter the view of a view controller is created.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
}
