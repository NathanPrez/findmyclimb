//
//  OutdoorCentre.swift
//  Mark2
//
//  Created by Nathan Preston on 05/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var OchosenLocation = ""
var Ocoodx = [53.936390, 53.640800, 55.596110, 56.553120, 56.910280, 53.098300, 54.08005, 56.64896, 57.74183, 53.34190, 53.25389, 53.07880, 53.12556, 52.94389, 52.94361, 52.96660, 58.10473, 53.08417, 53.08960, 54.48944, 53.53250, 56.57670, 54.51889, 53.29380, 56.70394, 53.31758, 54.11060, 51.18222,54.07361, 53.31700, 58.88750, 58.26170, 54.46150, 53.11917, 53.25626, 53.15460, 54.44953, 57.09195, 53.48390, 58.01333, 57.20220,53.35070, 53.32600, 53.53056, 54.48000, 53.11950, 58.17939, 54.24556, 53.51889, 59.02111]

var Ocoody = [-1.593330, -2.574700, -1.898330, -5.095740, -4.516390, -1.566700, -1.68541, -4.89510, -5.39369, -3.86690, -1.81722, -4.09090, -3.89500, -4.11917, -4.13111, -4.47760, -7.01569, -4.07083, -4.04970, -2.96472, -1.95917, -3.60000, -3.27917, -1.61860, -5.42433, -4.67994, -2.04140, -4.66889,-2.15889, -1.62360, -3.43306, -5.38030, -3.10520, -4.10278, -1.77604, -1.99310, -3.22002, -3.65028, -1.85220, -6.94611, -6.23420,-1.64470, -3.78590, -1.96528, -3.21940, -4.09530, -7.10438, -1.22333, -1.97583, -3.36028]


var Olist = ["Almscliff", "Anglezarke Quarry", "Back Bowden Doors", "Beinn Trilleachan", "Binnein Shuas crag", "Black Rocks", "Brimham Rocks", "Buachaille Etive Mor", "Carnmore Crag", "Castell y Gwynt", "Chee Dale", "Clogwyn Du'r Arddu", "Clogwyn yr Eryr", "Craig Bwlch y Moch", "Craig Pant Ifan", "Craig y Llam", "Creag Dubh Dibadale", "Cyrn Las", "Dinas Cromlech", "Dove Crag", "Dovestones Edge", "Dunkeld", "Eagle Crag", "Froggatt Edge", "Garbh Bheinn", "Gogarth Stack", "Kilnsey", "Lundy", "Malham Cove", "Millstone Edge", "Old Man of Hoy", "Old Man of Stoer", "Pavey Ark", "Rainbow Slab Area", "Raven Tor", "Roaches Lower Tier", "Scafell East Buttress", "Shelterstone Crag", "Shining Clough Rocks",  "Sron Ulladale", "Sron na Ciche", "Stanage Plantation", "The Diamond", "The Dovestones Quarries", "The Napes", "Twll Mawr", "Uig Sea Cliffs", "Whitestone Cliffe", "Wimberry Rocks", "Yesnaby"]

class OutdoorCentre: UIViewController, CLLocationManagerDelegate {
    
 
    @IBOutlet weak var OMap: MKMapView!
    
    let manager = CLLocationManager();//manages the location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        self.OMap.showsUserLocation = true //shows the location
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(OsearchActive){//only happens if the search bar is active
            if let i = Olist.index(of: Ofiltered[myIndex]){//any data which is in the filtered list is found in the main array and its index is updated to a new variable
                OindexFind = i
            }
        }
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest //setting accuracy to best possible
        manager.requestWhenInUseAuthorization()  //requests location when app is being used
        manager.startUpdatingLocation() //update the location
        
        
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1,0.1) //starting point zoom
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(Ocoodx[myIndex], Ocoody[myIndex])
        if (OsearchActive){
            OchosenLocation = Olist[OindexFind]
            location = CLLocationCoordinate2DMake(Ocoodx[OindexFind], Ocoody[OindexFind])//location coodinates if searchbar is used
        }
        else{
            OchosenLocation = Olist[myIndex]
            location = CLLocationCoordinate2DMake(Ocoodx[myIndex], Ocoody[myIndex])//location coodinates
        }
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        OMap.setRegion(region, animated: true)//outputs code
        
        let annotation = MKPointAnnotation()//creates annotation
        annotation.coordinate = location
        OMap.addAnnotation(annotation)//outputs annotation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


