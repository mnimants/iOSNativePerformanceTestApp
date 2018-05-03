//
//  MapViewController.swift
//  KursaDarbs
//
//  Created by Marcis Nimants on 03/05/2018.
//  Copyright © 2018 Marcis Nimants. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let universityLocation = CLLocation.init(latitude: 56.9497151, longitude: 24.1145698)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        zoomTheLocation(locationToZoom: universityLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("didReceiveMemoryWarning")
    }

    private func zoomTheLocation(locationToZoom: CLLocation) {
        let radius: CLLocationDistance = 500 // 500 meters
        
        // Create coordinate region with 500 meters around University of Latvia
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(locationToZoom.coordinate,
                                                                  radius, radius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}

