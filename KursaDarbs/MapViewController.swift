//
//  MapViewController.swift
//  KursaDarbs
//
//  Created by Marcis Nimants on 03/05/2018.
//  Copyright © 2018 Marcis Nimants. All rights reserved.
//

import UIKit
import MapKit

let universityLocation = CLLocation.init(latitude: 56.9497151, longitude: 24.1145698)
let tokyoLocation = CLLocation.init(latitude: 35.6735408, longitude: 139.5703047)
let nycLocation = CLLocation.init(latitude: 40.6976637, longitude: -74.1197639)
let londonLocation = CLLocation.init(latitude: 51.5287718, longitude: -0.2416803)

let duration: Double = 1
let intervalBetweenJumps: Double = 3

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var jumpButton: UIButton!

    @IBAction func didTapToggleJumping(_ sender: Any) {
        jumpToNextLocation()
    }
    
    var locations: [CLLocation] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations.append(contentsOf: [universityLocation, nycLocation, londonLocation, tokyoLocation])
        
        jumpButton.setTitle("Jump to next location", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("didReceiveMemoryWarning")
    }
    
    func jumpToNextLocation() {
        let radius: CLLocationDistance = 5000 // 5km
        
        currentIndex = currentIndex + 1
        if currentIndex == locations.count {
            currentIndex = 0
        }
        
        let location = locations[currentIndex]
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  radius, radius)
        mapView.animatedZoom(zoomRegion: coordinateRegion, duration: duration)
    }
}

extension MKMapView {
    func animatedZoom(zoomRegion:MKCoordinateRegion, duration:TimeInterval) {
        MKMapView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.setRegion(zoomRegion, animated: true)
        }, completion: nil)
    }
}

