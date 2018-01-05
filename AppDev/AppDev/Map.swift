//
//  Map.swift
//  AppDev
//
//  Created by Nathan Preston on 10/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

let manager = CLLocationManager();
var hasAn = 0
let locValue:CLLocationCoordinate2D = (manager.location?.coordinate)!
var lat = locValue.latitude, long = locValue.longitude
let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)

class Map: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var IMap: MKMapView!
    
    let manager = CLLocationManager();//manages the location
    
    
    @IBAction func press(_ sender: Any) {
        hasAn = 1
        
        let annotation = MKPointAnnotation()//creates annotation
        annotation.coordinate = location
        IMap.addAnnotation(annotation)//outputs annotation
        
        UserDefaults.standard.set(lat, forKey: "lat")
        UserDefaults.standard.set(long, forKey: "long")
        UserDefaults.standard.set(hasAn, forKey: "hasAn")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "hasAn") as? Int{
            hasAn = x
        }
        if(hasAn==1){
            if let x = UserDefaults.standard.object(forKey: "lat") as? CLLocationDegrees{
                lat = x
            }
            if let y = UserDefaults.standard.object(forKey: "long") as? CLLocationDegrees{
                long = y
            }
            
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            IMap.addAnnotation(annotation)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        self.IMap.showsUserLocation = true //shows the location
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest //setting accuracy to best possible
        manager.requestWhenInUseAuthorization()  //requests location when app is being used
        manager.startUpdatingLocation() //update the location
        
        let locValue:CLLocationCoordinate2D = (manager.location?.coordinate)!
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1,0.1) //starting point zoom
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)//location coodinates
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        IMap.setRegion(region, animated: true)//outputs code
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    

}
