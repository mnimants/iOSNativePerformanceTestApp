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

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var isJumpingAround = false
    
    var timer = Timer()
    
    @IBAction func didTapToggleJumping(_ sender: Any) {
        if isJumpingAround {
            stopJumping()
            
            return
        }
        
        startJumping()
    }
    
    var locations: [CLLocation] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locations.append(contentsOf: [universityLocation, nycLocation, londonLocation, tokyoLocation])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("didReceiveMemoryWarning")
    }

    private func startJumping() {
        isJumpingAround = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(jumpToNextLocation)), userInfo: nil, repeats: true)
        
    }
    private func stopJumping() {
        isJumpingAround = false
        timer.invalidate()
    }
    
    @objc func jumpToNextLocation() {
        let radius: CLLocationDistance = 5000 // 5km
        
        currentIndex = currentIndex + 1
        if currentIndex == locations.count {
            currentIndex = 0
        }
        
        let location = locations[currentIndex]
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  radius, radius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

