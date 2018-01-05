//
//  ViewController.swift
//  Mark 3
//
//  Created by Nathan Preston on 01/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1,0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(50.835878, -0.211434)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Boulder Brighton"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

