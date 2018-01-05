//
//  ViewController.swift
//  Mark2
//
//  Created by Nathan Preston on 24/09/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var IchosenLocation = ""
var myIndex = 0
var Icoodx = [56.460496, 53.399645, 53.413893, 52.981836, 53.138553, 52.381486, 52.038843, 51.494070, 50.835770, 52.529962, 50.916597, 51.493349, 51.463471, 51.153337, 51.477951, 51.340709, 51.260023, 52.454277, 51.694247, 55.923415, 50.823656, 55.850622, 52.859576, 51.137779, 50.852602, 51.097202, 50.386764, 53.644148, 51.456280, 54.601370, 54.342153, 53.469477, 51.528056, 52.971606, 50.948191, 57.118828, 51.442502, 52.489348, 50.858217, 51.433766, 54.564572, 53.491287, 51.687091, 51.582197, 53.210863, 50.910732, 51.574616, 54.914549, 51.542144, 51.493188, 50.595063, 50.470868, 51.565308, 51.676254, 53.431839, 51.476483, 52.924877, 53.464148, 52.956910, 53.390227, 53.265903, 56.713256, 53.218812, 53.784288, 53.396726, 56.118392, 52.228246, 50.718261, 51.494460, 52.667418, 51.471657, 51.862717, 57.154174, 51.485046, 51.518568, 53.769308, 51.516061, 51.372443, 52.573700, 51.747744]//x coodinates

var Icoody = [-2.981356, -1.446264, -2.133641, -2.114989, -4.252449, -1.558387, -0.687697, -0.060951, -0.211401, -2.024631, -1.393952, -3.141957, -0.112945, 0.279276, -0.188497, -0.170209, -0.568231, -1.886172, -3.898462, -3.397674, -0.099340, -4.305296, -4.112460, -0.991934, -0.160253, -0.191304, -4.152924, -1.788157, -0.087328, -3.139969, -2.740488, -2.204228, -0.039835, -1.170987, -2.528770, -2.137681, -0.970060, -1.895917, -1.165999, -2.611515, -1.215533, -2.245103, -3.300340, -1.753608, -0.572131, -1.399252, -3.296856, -1.415167, -0.172711, -0.060789, -4.275700, -3.540120, -0.092338, -0.602263, -2.990737, -0.199493, -1.451407, -2.320737, -1.142999, -1.471099, -1.352860, -4.962483, -4.199241, -1.576098, -2.594778, -3.914201, -0.906479, -1.979344, 0.042866, -1.166055, -2.576465, -2.247803, -2.081742, -0.122850, -0.163275, -2.680702, -0.219815, -0.291159, 1.118317, -0.456680]//y coodinates

var Ilist = ["Avertical World", "Awesome Walls Sheffield", "Awesome Walls Stockport", "Awesome Walls Stoke", "Beacon Climbing Centre", "Bear Rock Climbing", "Big Rock Climbing Centre", "Biscuit Factory Climbing", "Boulder Brighton", "Boulder Central", "Boulder Shack", "Boulders UK", "Brixton Recreation Centre", "Chimera Climbing Centre", "Clip N Climb Chelsea", "Craggy Island Bouldering", "Craggy Island Guildford", "Creation Climbing Centre", "Dynamic Rock Swansea", "Edinburgh International Climbing Arena", "Extreme Ventures Brighton", "Glasgow Climbing Centre", "Harlech Climbing Wall", "High Sports Alton", "High Sports Brighton", "High Sports Crawley", "High Sports Plymouth", "Huddersfield Climbing Centre", "JAGS Sports Club", "KONG Adventure", "Lakeland Climbing Centre", "Manchester Climbing Centre", "Mile End Climbing Wall", "Nottingham Climbing Centre", "Oxley Sports Centre", "RGU: Sport", "Reading Climbing Centre", "Red Point Birmingham", "Red Spider", "Redpoint Bristol Climbing Centre", "Rock Antics Middlesbrough", "Rock Over Climbing", "Rock UK Summit Centre", "Rockstar Climbing Centre", "Showroom Climbing Centre", "Southampton Climbing Centre", "Spot Climbing Centre", "Sunderland Wall", "Swiss Cottage Climbing Centre", "The Arch Climbing Wall", "The Barn Climbing Centre", "The Boulder Bunker", "The Castle Climbing Centre", "The Climb", "The Climbing Hangar Liverpool", "The Climbing Hangar London", "The Climbing Unit", "The Depot Manchester", "The Depot Nottingham", "The Foundry", "The Healthy Living Centre", "The Ice Factor", "The Indy Climbing Wall", "The Leeds Wall", "The North West Face Climbing Centre", "The Peak", "The Pinnacle Climbing Centre", "The Project Climbing Centre", "The Reach", "The Tower Climbing Centre", "The Undercover Rock", "The Warehouse Climbing", "Transition Extreme Sports", "Vauxhall Climbing Centre", "West 1 Climbing Wall", "West View Leisure Centre", "Westway Climbing", "White Spider", "Wymondham Leisure Centre", "XC"]//names of climbing centres

class IndoorCentre: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var IMap: MKMapView!
    
    
    let manager = CLLocationManager();//manages the location

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        self.IMap.showsUserLocation = true //shows the location
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(IsearchActive){//only happens if the search bar is active
            if let i = Ilist.index(of: Ifiltered[myIndex]){//any data which is in the filtered list is found in the main array and its index is updated to a new variable
                IindexFind = i
            }
        }
        
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest //setting accuracy to best possible
        manager.requestWhenInUseAuthorization()  //requests location when app is being used
        manager.startUpdatingLocation() //update the location
        
        
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1,0.1) //starting point zoom
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(Icoodx[myIndex], Icoody[myIndex])//location coodinates
        
        if (IsearchActive){
            IchosenLocation = Ilist[IindexFind]
            location = CLLocationCoordinate2DMake(Icoodx[IindexFind], Icoody[IindexFind])//location coodinates if searchbar is used
        }
        else{
            IchosenLocation = Ilist[myIndex]
            location = CLLocationCoordinate2DMake(Icoodx[myIndex], Icoody[myIndex])//location coodinates
        }
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        IMap.setRegion(region, animated: true)//outputs code
        
        let annotation = MKPointAnnotation()//creates annotation
        annotation.coordinate = location
        IMap.addAnnotation(annotation)//outputs annotation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   

}

